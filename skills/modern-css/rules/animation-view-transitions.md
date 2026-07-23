---
title: Page Transitions with View Transitions API
support: 89%
tags: animation, view-transitions, page, navigation
---

## Page Transitions with View Transitions API

**Replaces:** Barba.js or React Transition Group frameworks.

**Before:**

```js
// barba.js
barba.init({
  transitions: [{ leave: ({current}) => gsap.to(current, {opacity: 0}),
    enter: ({next}) => gsap.from(next, {opacity: 0}) }]
});
```

**After:**

```css
.hero {
  view-transition-name: hero;
}
```

```js
document.startViewTransition(() => updateDOM());
```

Named elements animate between states automatically. Works with both SPA navigation and MPA (cross-document) page transitions.
