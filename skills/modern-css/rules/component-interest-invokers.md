---
title: Hover Tooltips with Interest Invokers
support: 86%
tags: component, tooltip, hover, popover
---

## Hover Tooltips with Interest Invokers

**Replaces:** JavaScript mouseenter/mouseleave with focus/blur handlers.

**Before:**

```js
trigger.addEventListener('mouseenter', () => tooltip.show());
trigger.addEventListener('mouseleave', () => tooltip.hide());
trigger.addEventListener('focus', () => tooltip.show());
trigger.addEventListener('blur', () => tooltip.hide());
```

**After:**

```html
<button interestfor="tip">Hover me</button>
<div id="tip" popover="hint">Tooltip content</div>
```

Shows on hover and focus, hides on leave. Built-in delay and accessibility.
