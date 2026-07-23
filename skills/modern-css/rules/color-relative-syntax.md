---
title: Color Variants with Relative Color Syntax
support: 87%
tags: color, oklch, relative, variants, lighten, darken
---

## Color Variants with Relative Color Syntax

**Replaces:** Sass `lighten()` and `darken()` functions.

**Before:**

```scss
$brand: #3b82f6;
.btn-light { background: lighten($brand, 20%); }
.btn-dark { background: darken($brand, 20%); }
```

**After:**

```css
.btn-light {
  background: oklch(from var(--brand) calc(l + 0.2) c h);
}
.btn-dark {
  background: oklch(from var(--brand) calc(l - 0.2) c h);
}
```

Manipulate any channel (lightness, chroma, hue) directly from an existing color — no preprocessor needed.
