---
title: Smooth Height Animations with interpolate-size
support: 69%
tags: animation, height, auto, interpolate-size, experimental
---

## Smooth Height Animations with interpolate-size

**Replaces:** JavaScript-measured pixel heights with transition delays.

**Before:**

```js
const height = element.scrollHeight;
element.style.height = height + 'px';
element.style.transition = 'height 0.3s';
```

**After:**

```css
:root {
  interpolate-size: allow-keywords;
}
.accordion {
  height: auto;
  transition: height 0.3s;
}
.accordion.collapsed {
  height: 0;
}
```

Enables transitions to/from `height: auto` — previously impossible without JavaScript.
