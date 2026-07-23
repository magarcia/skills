---
title: Scroll Chaining Control with overscroll-behavior
support: 96%
tags: performance, overscroll, scroll, modal
---

## Scroll Chaining Control with overscroll-behavior

**Replaces:** JavaScript `preventDefault` on wheel events.

**Before:**

```js
modal.addEventListener('wheel', e => {
  if (atTop || atBottom) e.preventDefault();
}, { passive: false });
```

**After:**

```css
.modal {
  overflow-y: auto;
  overscroll-behavior: contain;
}
```

Prevents scroll from leaking to parent/body when reaching the end of a scrollable element.
