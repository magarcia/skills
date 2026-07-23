---
title: Direction-Aware Layouts with Logical Properties
support: 96%
tags: layout, logical-properties, rtl, i18n
---

## Direction-Aware Layouts with Logical Properties

**Replaces:** Separate left/right and RTL attribute selectors.

**Before:**

```css
.element {
  margin-left: 1rem;
  padding-right: 1rem;
  border-top: 1px solid;
}
[dir="rtl"] .element {
  margin-left: 0;
  margin-right: 1rem;
  padding-right: 0;
  padding-left: 1rem;
}
```

**After:**

```css
.element {
  margin-inline-start: 1rem;
  padding-inline-end: 1rem;
  border-block-start: 1px solid;
}
```

Key mappings: `left/right` → `inline-start/inline-end`, `top/bottom` → `block-start/block-end`.
