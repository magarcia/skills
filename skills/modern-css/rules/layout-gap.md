---
title: Element Spacing with gap
support: 95%
tags: layout, spacing, flex, grid
---

## Element Spacing with gap

**Replaces:** Margin right with `:last-child` override pattern.

**Before:**

```css
.list > * {
  margin-right: 16px;
}
.list > *:last-child {
  margin-right: 0;
}
```

**After:**

```css
.list {
  display: flex;
  gap: 16px;
}
```

Works with both `flex` and `grid` layouts.
