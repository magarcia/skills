---
title: Typed Custom Properties with @property
support: 92%
tags: animation, property, custom-properties, typed
---

## Typed Custom Properties with @property

**Replaces:** String-based CSS variables that can't be animated.

**Before:**

```css
:root { --hue: 0; }
.element {
  color: hsl(var(--hue), 100%, 50%);
  /* transition: --hue 1s doesn't work — browser sees it as a string */
}
```

**After:**

```css
@property --hue {
  syntax: "<angle>";
  inherits: false;
  initial-value: 0deg;
}

.element {
  color: hsl(var(--hue), 100%, 50%);
  transition: --hue 1s;
}
.element:hover {
  --hue: 180deg;
}
```

Registering the type lets the browser interpolate the value during transitions and animations.
