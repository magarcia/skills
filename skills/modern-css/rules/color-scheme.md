---
title: Dark Mode Defaults with color-scheme
support: 93%
tags: color, dark-mode, color-scheme, theme
---

## Dark Mode Defaults with color-scheme

**Replaces:** Extensive media query CSS for form control styling.

**Before:**

```css
@media (prefers-color-scheme: dark) {
  input, select, textarea {
    background: #333;
    color: #eee;
    border-color: #555;
  }
}
```

**After:**

```css
:root {
  color-scheme: light dark;
}
```

Browser automatically adapts form controls, scrollbars, and system colors to match the user's preference.
