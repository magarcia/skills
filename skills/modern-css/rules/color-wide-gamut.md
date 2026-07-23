---
title: Vivid Colors Beyond sRGB
support: 90%
tags: color, wide-gamut, display-p3
---

## Vivid Colors Beyond sRGB

**Replaces:** Limited sRGB hex color values.

**Before:**

```css
.hero {
  color: #ff3300; /* limited to sRGB gamut */
}
```

**After:**

```css
.hero {
  color: oklch(0.7 0.25 29);
  /* or */
  color: color(display-p3 1 0.2 0.1);
}
```

Wide gamut colors are more vivid on displays that support them (most modern screens). Use `@media (color-gamut: p3)` for progressive enhancement if needed.
