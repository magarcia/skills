# Agent Skills

Agent skills I use every day to take work from idea to merged PR.

They're built to complement [Matt Pocock's skills](https://github.com/mattpocock/skills). His set covers alignment, planning, and test-driven implementation. Mine picks up where his stops: verification, PR publication, CI babysitting, quality passes, and the writing around the code.

These skills are small, composable, and agent-agnostic. Copy one, read it, make it yours.

## Quickstart

1. Install with the [skills.sh](https://skills.sh) installer:

```bash
npx skills@latest add magarcia/skills
```

2. Pick the skills you want and the agents you want them installed on.

Prefer to do it by hand? Copy any directory under [`skills/`](skills/) into your agent's skills directory, then read its `SKILL.md` before use. Some skills name dependencies in their descriptions; check those first.

## Why These Skills Exist

### #1: The agent stops at "the code compiles"

Coding agents consider the job done when the diff looks plausible. The job is done when the PR is merged and CI is green. That last stretch (proving the change works, checking the UI, writing the PR, chasing CI failures and review comments) is where agents quietly give up and hand the work back to you.

The fix is a delivery pipeline:

- [`/verify`](./skills/verify/SKILL.md) proves the change works end to end, because a green test suite is not the same thing as a working feature.
- [`/ship`](./skills/ship/SKILL.md) chains verification, UI checks, PR publication, and CI follow-up into one flow.
- [`/babysit`](./skills/babysit/SKILL.md) watches the open PR: CI failures, flaky retries, review comments, conflicts.
- [`/build`](./skills/build/SKILL.md) runs the whole lifecycle, driving Matt's `/implement` and `/tdd` in the middle.

### #2: Fast code accumulates slop

Agents write code faster than any human, which means they also accumulate duplication, dead code, weak types, and stale docs faster than any human. Left alone, a week of agent-assisted work turns into a codebase nobody wants to touch.

The fix is dedicated cleanup passes with different risk profiles:

- [`/simplify`](./skills/simplify/SKILL.md) is behavior-preserving: reuse, clarity, types, dead code. Safe before any PR.
- [`/improve-vibecode`](./skills/improve-vibecode/SKILL.md) is the aggressive version: eight specialist subagents that change behavior, so it needs re-verification after.
- [`/docs`](./skills/docs/SKILL.md) finds the documentation your change just made false. "Behavior-preserving" refactors are the worst offenders here.
- [`/regrouping-git-history`](./skills/regrouping-git-history/SKILL.md) turns 30 fixup commits into 4 logical ones before review, without touching the final tree.

### #3: Half the job is prose

PR descriptions, docs, blog posts, tickets. Agents write all of them in the same recognizable voice, and it's not yours.

The fix is treating writing as its own discipline:

- [`/writing-clearly-and-concisely`](./skills/writing-clearly-and-concisely/SKILL.md) applies Strunk's rules: active voice, omit needless words.
- [`/writing-without-ai-tells`](./skills/writing-without-ai-tells/SKILL.md) strips the vocabulary and structural patterns that make text read machine-generated.
- [`/writing-technical-blogs`](./skills/writing-technical-blogs/SKILL.md) structures technical posts developers actually finish reading.

## Reference

### Delivery

- **[build](./skills/build/SKILL.md)**: Deliver a feature or ticket end to end: requirements, exploration, test-driven implementation, docs sync, verification, merged PR.
- **[to-tickets](./skills/to-tickets/SKILL.md)**: Break a plan, spec, or conversation into tracer-bullet tickets, each declaring its blocking edges on your tracker.
- **[verify](./skills/verify/SKILL.md)**: Prove a change works end to end: acceptance criteria, project gates, real user flows, edge cases, reliability checks.
- **[design](./skills/design/SKILL.md)**: Check design-system and UI consistency for diffs that touch user-facing surfaces. Small diffs hide visual regressions too.
- **[pr](./skills/pr/SKILL.md)**: Commit, push, and open a PR following repository conventions: branch naming, commit format, templates, issue links.
- **[ship](./skills/ship/SKILL.md)**: Take a finished change from diff to merged PR. Runs verify, design, pr, and babysit in sequence.
- **[babysit](./skills/babysit/SKILL.md)**: Monitor an open PR to merge: CI failures, review feedback, conflicts, draft-to-ready transitions.

### Quality

- **[simplify](./skills/simplify/SKILL.md)**: Behavior-preserving quality pass over changed files: reuse, clarity, types, dead code, structure.
- **[improve-vibecode](./skills/improve-vibecode/SKILL.md)**: Aggressive audit of AI-assisted code through specialist subagents: duplication, type ownership, dead code, defensive programming. Changes behavior; re-verify after.
- **[docs](./skills/docs/SKILL.md)**: Find and fix repository documentation a code change made false: READMEs, docs, ADR references, command examples, config.
- **[regrouping-git-history](./skills/regrouping-git-history/SKILL.md)**: Rebuild a tangled feature branch into a few reviewer-friendly commits, preserving the final tree byte-for-byte.

### Writing

- **[writing-clearly-and-concisely](./skills/writing-clearly-and-concisely/SKILL.md)**: Apply Strunk's *Elements of Style* to make prose clearer, stronger, and shorter.
- **[writing-technical-blogs](./skills/writing-technical-blogs/SKILL.md)**: Write technical blog posts developers actually read: structure, hooks, skim-test headers.
- **[writing-without-ai-tells](./skills/writing-without-ai-tells/SKILL.md)**: Write or rewrite prose so it reads like a thoughtful human, not a language model.

### Guides

Reference skills the agent reaches for on its own when the task fits.

- **[cli-design](./skills/cli-design/SKILL.md)**: Build human-first command-line tools: command structure, output formatting, error handling, configuration.
- **[modern-css](./skills/modern-css/SKILL.md)**: Modern CSS patterns and the legacy hacks, JS workarounds, and library dependencies they replace.

### Utilities

- **[agent-browser-locale](./skills/agent-browser-locale/SKILL.md)**: Reproduce locale and i18n bugs by forcing a non-English JS runtime locale through CDP. For everything that "works in English, breaks in sv-SE".
- **[pr-image-upload](./skills/pr-image-upload/SKILL.md)**: Embed local images in GitHub PR and issue bodies through GitHub's web editor, because `gh` can't upload images.
- **[stt](./skills/stt/SKILL.md)**: Transcribe audio and video locally on macOS with parakeet-mlx. Apple Silicon only.

## Skills I Use But Don't Vendor

The delivery skills above compose several of [Matt Pocock's skills](https://github.com/mattpocock/skills). I use these unmodified:

`code-review`, `codebase-design`, `diagnosing-bugs`, `domain-modeling`, `grill-me`, `grill-with-docs`, `grilling`, `handoff`, `implement`, `improve-codebase-architecture`, `prototype`, `research`, `resolving-merge-conflicts`, `tdd`, `teach`, `to-spec`, `triage`, `wayfinder`, `writing-great-skills`

They were byte-for-byte identical to upstream when I assembled this repo, so I link to the maintained originals instead of duplicating them here.

I also use [Vercel's `agent-browser`](https://github.com/vercel-labs/agent-browser) directly. `agent-browser-locale` and `pr-image-upload` depend on it.

## Provenance

Most skills here are original work or local adaptations with no identified public upstream. Three are modified from public projects:

| Skill | Upstream | Local changes |
|---|---|---|
| `modern-css` | [Caidan Williams's `modern-css`](https://github.com/caidanw/skills/tree/main/modern-css), sourced from [modern-css.com](https://modern-css.com/) | Reorganized the monolithic guide into an index plus per-technique rules, rewrote the workflow and support tiers, added explicit browser-policy verification. |
| `to-tickets` | [Matt Pocock's `to-tickets`](https://github.com/mattpocock/skills/tree/main/skills/to-tickets) | Removes Claude-only invocation metadata and works the dependency frontier one ticket at a time with `/implement`, clearing context between tickets. |
| `writing-clearly-and-concisely` | [`obra/the-elements-of-style`](https://github.com/obra/the-elements-of-style) | Rewrites and condenses the skill wrapper while keeping the public-domain 1918 Strunk reference text. |

Each modified skill documents its provenance in an `UPSTREAM.md` file. Upstream license notices live under [`LICENSES/`](LICENSES/), with details in [`THIRD_PARTY_NOTICES.md`](THIRD_PARTY_NOTICES.md).

## License

[MIT](LICENSE). The modified upstream skills keep their applicable notices in [`LICENSES/`](LICENSES/), and the 1918 edition of William Strunk Jr.'s *The Elements of Style* is public domain.
