---
title: Form Control Styling with accent-color
support: 93%
tags: form, accent-color, checkbox, radio
---

## Form Control Styling with accent-color

**Replaces:** `appearance: none` with 20+ lines of custom styling.

**Before:**

```css
input[type="checkbox"] {
  appearance: none;
  width: 18px;
  height: 18px;
  border: 2px solid #ccc;
  border-radius: 3px;
}
input[type="checkbox"]:checked {
  background: #7c3aed;
  border-color: #7c3aed;
  /* plus custom checkmark via ::after */
}
```

**After:**

```css
input[type="checkbox"],
input[type="radio"] {
  accent-color: #7c3aed;
}
```

One line to brand checkboxes, radios, range sliders, and progress bars.
