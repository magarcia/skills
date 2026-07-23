---
title: Dark Mode Colors with light-dark()
support: 83%
tags: color, dark-mode, light-dark, theme
---

## Dark Mode Colors with light-dark()

**Replaces:** Duplicated variables in media queries.

**Before:**

```css
:root { --text: #111; }
@media (prefers-color-scheme: dark) {
  :root { --text: #eee; }
}
```

**After:**

```css
:root {
  color-scheme: light dark;
}
body {
  color: light-dark(#111, #eee);
}
```

Requires `color-scheme` to be set. First value is for light mode, second for dark.
