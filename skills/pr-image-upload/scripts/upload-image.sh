#!/usr/bin/env bash

# Upload an image through GitHub's comment file input and print the hosted URL.
# The comment draft is always cleared and is never submitted.

set -euo pipefail

IMAGE_PATH="${1:?usage: upload-image.sh <image-path> <github-pr-or-issue-url>}"
TARGET_URL="${2:?usage: upload-image.sh <image-path> <github-pr-or-issue-url>}"
BROWSER_PROFILE="${GH_BROWSER_PROFILE:?set GH_BROWSER_PROFILE to a verified logged-in Chrome profile}"
EXPECTED_LOGIN="${GH_EXPECTED_LOGIN:?set GH_EXPECTED_LOGIN to the expected GitHub login}"

if [[ ! -f "$IMAGE_PATH" ]]; then
  printf 'No such image: %s\n' "$IMAGE_PATH" >&2
  exit 1
fi

if [[ ! "$TARGET_URL" =~ ^https://github\.com/[^/]+/[^/]+/(pull|issues)/[0-9]+/?([?#].*)?$ ]]; then
  printf 'Refusing unsupported GitHub target: %s\n' "$TARGET_URL" >&2
  exit 1
fi
if [[ ! "$EXPECTED_LOGIN" =~ ^[A-Za-z0-9-]+$ ]]; then
  printf 'Invalid expected GitHub login: %s\n' "$EXPECTED_LOGIN" >&2
  exit 1
fi

UPLOAD_SESSION=$(agent-browser session id --scope cwd --prefix pr-image-upload)
SESSION_STARTED=false
DRAFT_TOUCHED=false

browser() {
  agent-browser --session "$UPLOAD_SESSION" "$@"
}

cleanup() {
  local cleanup_status=$?
  trap - EXIT

  if [[ "$DRAFT_TOUCHED" == true ]]; then
    browser fill '#new_comment_field' '' >/dev/null 2>&1 || true
  fi
  if [[ "$SESSION_STARTED" == true ]]; then
    browser close >/dev/null 2>&1 || true
  fi

  exit "$cleanup_status"
}
trap cleanup EXIT

agent-browser --session "$UPLOAD_SESSION" --profile "$BROWSER_PROFILE" open "$TARGET_URL" >/dev/null
SESSION_STARTED=true
browser set viewport 1440 900 >/dev/null
browser wait --load networkidle >/dev/null 2>&1 || true

CURRENT_URL=$(browser get url 2>&1 | tail -1)
TARGET_CANONICAL="${TARGET_URL%%[?#]*}"
CURRENT_CANONICAL="${CURRENT_URL%%[?#]*}"
TARGET_CANONICAL="${TARGET_CANONICAL%/}"
CURRENT_CANONICAL="${CURRENT_CANONICAL%/}"
if [[ "$CURRENT_CANONICAL" != "$TARGET_CANONICAL" ]]; then
  printf 'Refusing redirected target: %s\n' "$CURRENT_URL" >&2
  exit 1
fi

STATE_SCRIPT="(()=>JSON.stringify({login:document.querySelector('meta[name=user-login]')?.content||'',comment:!!document.querySelector('#new_comment_field'),fileInput:!!document.querySelector('#fc-new_comment_field')}))()"
STATE=$(browser eval "$STATE_SCRIPT" 2>&1 | tail -1)

if [[ "$STATE" != *'"login":"'"$EXPECTED_LOGIN"'"'* && "$STATE" != *'\"login\":\"'"$EXPECTED_LOGIN"'\"'* ]]; then
  printf 'Expected GitHub login %s was not active (state: %s)\n' "$EXPECTED_LOGIN" "$STATE" >&2
  exit 1
fi
case "$STATE" in
  *'"comment":true'*'"fileInput":true'* | *'\"comment\":true'*'\"fileInput\":true'*) ;;
  *)
    printf 'GitHub comment editor not found (state: %s)\n' "$STATE" >&2
    exit 1
    ;;
esac

browser upload '#fc-new_comment_field' "$IMAGE_PATH" >/dev/null
DRAFT_TOUCHED=true

HOSTED_URL=''
for _ in {1..30}; do
  DRAFT_VALUE=$(browser eval "(()=>document.querySelector('#new_comment_field')?.value||'')()" 2>&1 | tail -1)
  HOSTED_URL=$(printf '%s\n' "$DRAFT_VALUE" | rg -o 'https://github\.com/user-attachments/assets/[a-f0-9-]+' | head -1 || true)
  if [[ -n "$HOSTED_URL" ]]; then
    break
  fi
  sleep 2
done

if [[ -z "$HOSTED_URL" ]]; then
  printf 'Upload did not yield a GitHub user-attachments URL within 60 seconds\n' >&2
  exit 1
fi

printf '%s\n' "$HOSTED_URL"
