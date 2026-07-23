---
title: Perceptually Uniform Colors with oklch
support: 90%
tags: color, oklch, perceptual
---

## Perceptually Uniform Colors with oklch

**Replaces:** Manual color shade guessing with hex values.

**Before:**

```css
:root {
  --blue-100: #dbeafe;
  --blue-200: #bfdbfe;
  --blue-500: #3b82f6;
  --blue-900: #1e3a5f;
}
```

**After:**

```css
:root {
  --brand: oklch(0.55 0.2 264);
  --brand-light: oklch(0.85 0.1 264);
  --brand-dark: oklch(0.35 0.2 264);
}
```

Lightness (first value) is the only variable needed for consistent shade generation. Equal lightness differences produce equal perceived brightness differences.
