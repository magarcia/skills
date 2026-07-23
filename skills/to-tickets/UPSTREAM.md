# Upstream

This skill is a modified version of
[Matt Pocock's `to-tickets` skill](https://github.com/mattpocock/skills/tree/main/skills/to-tickets).

The local version removes Claude-only invocation metadata for Codex
compatibility and adds one sequencing instruction: work the dependency frontier
one ticket at a time with `/implement`, clearing context between tickets.

The upstream MIT license is preserved at
[`../../LICENSES/Matt-Pocock-MIT.txt`](../../LICENSES/Matt-Pocock-MIT.txt).
