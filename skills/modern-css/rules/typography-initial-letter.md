---
title: Drop Caps with initial-letter
support: 91%
tags: typography, drop-cap, initial-letter
---

## Drop Caps with initial-letter

**Replaces:** Float-based layout with fragile line-height adjustments.

**Before:**

```css
.article::first-letter {
  float: left;
  font-size: 3.5em;
  line-height: 0.8;
  margin-right: 0.1em;
}
```

**After:**

```css
.article::first-letter {
  initial-letter: 3;
}
```

The number specifies how many lines the drop cap should span.
