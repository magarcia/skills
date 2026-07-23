---
title: Range Style Queries
support: 88%
tags: selector, container, style-query, range
---

## Range Style Queries

**Replaces:** Multiple `@container style()` blocks for each value.

**Before:**

```css
@container style(--progress: 50) { .bar { background: yellow; } }
@container style(--progress: 75) { .bar { background: green; } }
```

**After:**

```css
@container style(--progress > 50%) {
  .bar {
    background: green;
  }
}
```

Compare custom property values with range operators instead of exact matches.
