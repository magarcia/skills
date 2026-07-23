---
title: Dropdown Menus with Popover API
support: 86%
tags: component, popover, dropdown, menu
---

## Dropdown Menus with Popover API

**Replaces:** JavaScript toggle classes with click/outside/ESC handling.

**Before:**

```js
button.addEventListener('click', () => menu.classList.toggle('open'));
document.addEventListener('click', e => {
  if (!menu.contains(e.target) && e.target !== button) {
    menu.classList.remove('open');
  }
});
```

**After:**

```html
<button popovertarget="menu">Menu</button>
<div id="menu" popover>
  <a href="/settings">Settings</a>
  <a href="/logout">Logout</a>
</div>
```

Built-in: toggle on click, close on outside click, close on ESC, top layer positioning. No JavaScript required.
