---
title: Scroll-Linked Animations
support: 78%
tags: animation, scroll, timeline, gpu
---

## Scroll-Linked Animations

**Replaces:** JavaScript IntersectionObserver with opacity/transform changes.

**Before:**

```js
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
    }
  });
});
document.querySelectorAll('.animate').forEach(el => observer.observe(el));
```

**After:**

```css
.element {
  animation: fade-in linear;
  animation-timeline: view();
  animation-range: entry;
}

@keyframes fade-in {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}
```

GPU-accelerated, runs off the main thread. Use `animation-timeline: scroll()` for progress-based animations.
