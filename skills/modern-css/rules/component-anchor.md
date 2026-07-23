---
title: Tooltip Positioning with Anchor Positioning
support: 77%
tags: component, anchor, tooltip, positioning
---

## Tooltip Positioning with Anchor Positioning

**Replaces:** Popper.js or Floating UI libraries.

**Before:**

```js
import { computePosition, flip, offset } from '@floating-ui/dom';
computePosition(trigger, tooltip, {
  placement: 'bottom',
  middleware: [offset(8), flip()],
}).then(({x, y}) => { /* position tooltip */ });
```

**After:**

```css
.trigger {
  anchor-name: --tip;
}
.tooltip {
  position: absolute;
  position-anchor: --tip;
  top: anchor(bottom);
  left: anchor(center);
  position-try-fallbacks: flip-block;
}
```

Automatic flip fallbacks included. No JavaScript library needed.
