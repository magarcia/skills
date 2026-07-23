---
title: Animating Display None with transition-behavior
support: 85%
tags: animation, transition, display, allow-discrete
---

## Animating Display None with transition-behavior

**Replaces:** JavaScript `transitionend` listeners with visibility/opacity hacks.

**Before:**

```js
element.style.opacity = '0';
element.addEventListener('transitionend', () => {
  element.style.display = 'none';
});
```

**After:**

```css
.panel {
  transition: opacity 0.2s, display 0.2s;
  transition-behavior: allow-discrete;
}
.panel.hidden {
  opacity: 0;
  display: none;
}
```

Combine with `@starting-style` for enter/exit animations without JavaScript.
