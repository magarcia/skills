---
title: Positioning Shorthand with inset
support: 93%
tags: layout, positioning, shorthand
---

## Positioning Shorthand with inset

**Replaces:** Four separate properties (top, right, bottom, left).

**Before:**

```css
.overlay {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
```

**After:**

```css
.overlay {
  position: absolute;
  inset: 0;
}
```

Also supports asymmetric values: `inset: 10px 20px` (block, inline) or `inset: 10px 20px 30px 40px`.
