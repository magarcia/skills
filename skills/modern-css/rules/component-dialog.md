---
title: Modal Dialogs with dialog Element
support: 96%
tags: component, dialog, modal, a11y
---

## Modal Dialogs with dialog Element

**Replaces:** Fixed overlay positioning with z-index, ESC key, focus trap JavaScript.

**Before:**

```js
const modal = document.querySelector('.modal');
modal.classList.add('open');
document.addEventListener('keydown', e => { if (e.key === 'Escape') close(); });
trapFocus(modal);
```

**After:**

```html
<dialog id="dlg">
  <p>Modal content</p>
  <form method="dialog"><button>Close</button></form>
</dialog>
```

```css
dialog::backdrop {
  background: rgb(0 0 0 / 0.5);
}
```

```js
dlg.showModal(); // opens with backdrop, ESC key, focus trap built-in
```

Built-in accessibility: focus trapping, ESC to close, `::backdrop` pseudo-element, top layer positioning (no z-index).
