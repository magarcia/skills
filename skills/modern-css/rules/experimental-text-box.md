---
title: Vertical Text Centering with text-box
support: 79%
tags: typography, text-box, centering, experimental
---

## Vertical Text Centering with text-box

**Replaces:** Uneven padding hacks and line-height tweaks.

**Before:**

```css
button {
  padding: 8px 16px;
  /* visually off-center due to font metrics */
}
```

**After:**

```css
h1, button {
  text-box: trim-both cap alphabetic;
}
```

Trims leading/trailing space from font metrics for pixel-perfect vertical centering.
