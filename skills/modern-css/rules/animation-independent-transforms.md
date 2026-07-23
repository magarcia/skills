---
title: Independent Transforms
support: 92%
tags: animation, transform, translate, rotate, scale
---

## Independent Transforms

**Replaces:** Single `transform` shorthand requiring complete rewriting.

**Before:**

```css
.icon { transform: translate(10px, 0) rotate(45deg) scale(1.2); }
.icon:hover { transform: translate(10px, 0) rotate(90deg) scale(1.2); }
/* must repeat entire transform to change one value */
```

**After:**

```css
.icon {
  translate: 10px 0;
  rotate: 45deg;
  scale: 1.2;
}
.icon:hover {
  rotate: 90deg;
  /* translate and scale unchanged — no need to repeat */
}
```

Each property can be transitioned independently too.
