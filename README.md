# Simple Panels

**Simple Panels** is a lightweight panel system for Minetest servers.  
It allows server administrators to create, edit and display custom panels
using formspecs, without heavy dependencies.

The mod is designed to be simple, fast and easy to use.

---

## ✨ Features

- Visual panel editor (formspec-based)
- Show panels using chat commands
- Colored text support (`[color]`)
- Semi-transparent gray background
- Admin-only access (privilege-based)
- Panel list interface
- Persistent storage using mod storage
- Very lightweight, no dependencies
- Ready for translations (`locale` support)

---

## 🔐 Privileges

### `panel_admin`
Allows the player to:
- Create panels
- Edit panels
- View panels
- List all panels

Only players with this privilege can use the mod commands.

---

## 💬 Chat Commands

### `/panel`
Opens the main panel menu.

### `/panel <name>`
Shows the specified panel.

### `/edit <name>`
Opens the editor for the specified panel.

### `/panels`
Opens a list of all created panels.

---

## 🪟 Panels

Panels are created using a visual editor and support:
- Multiline text
- Minetest color tags (example: `[color=#00FFAA]Welcome[/color]`)
- Exit button to close the panel

Panels are stored persistently and remain after server restarts.

---

## 🌍 Translations

The mod supports Minetest's translation system.

Included languages:
- English (`en`)
- Spanish (`es`)
- Portuguese (`pt`)
- German (`de`)
- Russian (`ru`)

Translations are located in the `locale/` folder.

---

## 📁 Mod Structure
simple_panels/ ├── init.lua ├── ui.lua ├── storage.lua ├── privs.lua ├── mod.conf ├── description.txt ├── README.md ├── LICENSE └── locale/ ├── en.tr ├── es.tr ├── pt.tr ├── de.tr └── ru.tr
---

## 📦 Dependencies

This mod has **no dependencies**.  
It only uses the Minetest core API.

---

## 🧪 Compatibility

- Minetest 5.0.0 or newer
- Works with Minetest Game and compatible games

---

## 📜 License

This mod is released under the **MIT License**.  
See the `LICENSE` file for details.

---

## 👤 Author

crisdan 

---

## 🚀 Notes

This mod is intentionally minimal.  
Additional features such as automatic panels, timed panels or interactive
buttons can be added in future versions.
