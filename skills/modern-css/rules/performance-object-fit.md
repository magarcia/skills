---
title: Responsive Images with object-fit
support: 96%
tags: performance, object-fit, images, responsive
---

## Responsive Images with object-fit

**Replaces:** Background-image cover/position pattern.

**Before:**

```css
.hero {
  background-image: url('hero.jpg');
  background-size: cover;
  background-position: center;
  height: 200px;
}
```

**After:**

```css
.hero img {
  object-fit: cover;
  width: 100%;
  height: 200px;
}
```

Works with `<img>` and `<video>` elements directly. Better for accessibility (alt text) and performance (lazy loading).
