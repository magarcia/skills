---
title: Selector Grouping with :is()
support: 96%
tags: selector, is, grouping, specificity
---

## Selector Grouping with :is()

**Replaces:** Repeating selectors for shared prefix.

**Before:**

```css
.card h1,
.card h2,
.card h3,
.card h4 {
  margin-bottom: 0.5em;
}
```

**After:**

```css
.card :is(h1, h2, h3, h4) {
  margin-bottom: 0.5em;
}
```

Note: `:is()` takes the specificity of its most specific argument. Use `:where()` for zero-specificity alternative.
