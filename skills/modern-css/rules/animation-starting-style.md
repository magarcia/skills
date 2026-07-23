---
title: Entry Animations with @starting-style
support: 85%
tags: animation, starting-style, entry, transition
---

## Entry Animations with @starting-style

**Replaces:** `requestAnimationFrame` or `setTimeout` class addition after paint.

**Before:**

```js
element.style.opacity = '0';
requestAnimationFrame(() => {
  requestAnimationFrame(() => {
    element.style.opacity = '1';
  });
});
```

**After:**

```css
.card {
  opacity: 1;
  transform: translateY(0);
  transition: opacity 0.3s, transform 0.3s;

  @starting-style {
    opacity: 0;
    transform: translateY(10px);
  }
}
```

Defines the initial state for elements when they first appear in the DOM.
