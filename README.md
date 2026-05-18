# 🅽 nvimSetup

Personal Neovim configuration designed to work on both **Windows** and **Linux**.  
This repository contains:

- full Neovim config (`nvim/`)
- automatic installer for Linux (`install_linux.sh`)
- automatic installer for Windows (`install_windows.ps1`)
- symlink creation (so Neovim always loads this repo as its config)
- installation of required CLI tools (ripgrep, fd, fzf)
- plugin management via **lazy.nvim**
- ready-to-use IDE setup for **C** and **Lua**
- **Mason** for easy management of LSP servers, DAP, linters, and formatters

---

## 📁 Repository structure

- `nvim/`: The main Neovim configuration directory.
  - `init.lua`: Entry point for the Neovim configuration.
  - `lua/`: Contains modular Lua configurations.
    - `options.lua`: Centralizes all Neovim settings
    - `keymaps.lua`: Custom keybindings.
    - `plugins.lua`: Configuration for plugin management.
    - `lsp.lua`: LSP (Language Server Protocol) setup.
    - `utils.lua`: Helper functions (safe require, keymap wrapper, OS detection)
- `install_linux.sh`: Shell script for automated installation on Linux systems.
- `install_windows.ps1`: PowerShell script for automated installation on Windows systems.

---

# 🚀 Features

- **lazy.nvim** plugin manager (auto‑bootstrap)
- **Mason** for managing LSP, DAP, linters, and formatters
- **LSP** for:
  - C++ (clangd)
  - Lua (lua-language-server)
- **Treesitter** for syntax highlighting and code structure
- **fzf-lua** for fast file/grep navigation
- **nvim-cmp** for autocompletion
- **Nerd Fonts auto-install** 
- **Automatic LSP and formatter installation**
- **neo-tree file explorer**
- **Treesitter for syntax + indent**
- **conform.nvim for formatting**
- **gitsigns**
- **vim-fugitive + diffview**
- **lualine**
- **catppuccin theme**
- **Markdown support**
- Works on:
  - Windows 11
  - Linux (Ubuntu, Fedora, Arch, etc.)
- Fully portable — clone repo, run installer, done

---

# 🪟 Windows installation

Requires PowerShell 7+.

```powershell
git clone https://github.com/mlawski/nvimSetup
cd nvimSetup
powershell -ExecutionPolicy Bypass -File install_windows.ps1
```

This will:

create a symlink at
`%LOCALAPPDATA%\nvim` $\rightarrow$ `nvimSetup\nvim`

install tools via Scoop (if available):

- git
- ripgrep
- fd
- fzf
- neovim
- lua-language-server
- LLVM (clangd + clang-format)
- stylua
- python + black
- JetBrainsMono Nerd Font

prepare Neovim for first launch

Then run:
```
nvim
```

`Lazy.nvim` will automatically install all plugins.

# 🐧 Linux installation
```bash
git clone https://github.com/mlawski/nvimSetup
cd nvimSetup
chmod +x install_linux.sh
./install_linux.sh
```
- installs ripgrep, fd, fzf
- installs clangd, clang-format
- installs stylua, black
- installs Nerd Fonts

Once the installer finishes, simply run:
```
nvim
```
`lazy.nvim` will automatically bootstrap itself and install all required plugins.

---

## 🔧 Requirements

- **Neovim** 0.9+ (0.10+ recommended)
- **Git**

---

## ⌨️ Keybindings

**Note:** The `<leader>` key is set to `Space`.

| Action | Key |
| :--- | :--- |
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| Buffers | `<leader>fb` |
| Help tags | `<leader>fh` |
| Toggle Neotree | `<leader>e` |
| LSP Hover | `K` |
| Show Diagnostic | `<leader>d` |
| Diagnostic List | `<leader>q` |
| Prev Diagnostic | `[d` |
| Next Diagnostic | `]d` |
| Trigger Autocomplete | `<C-Space>` |
| Git Status | `<leader>gs` |
| Git commit | `<leader>gc` |
| Git push | `<leader>gp` |
| Git blame | `<leader>gb` |
| Diff current file | `<leader>gd` |
| Open diffview | `<leader>dv` |
| Closs diffview | `<leader>dc` |
| File history | `<leader>dh` |
| MarkdownPrevStart | `<leader>mp` |
| MarkdownPrevStop | `<leader>ms` |

---

## 🛠️ LSP Support

### C++
Uses `clangd`.

### Lua
Uses `lua-language-server` with `stylua formatter`.

### Python
Uses `black formatter`.

---

## 🧪 First Launch & Setup

1. Run `nvim`.
2. Wait for `lazy.nvim` to finish downloading and compiling plugins.
3. Restart Neovim to ensure everything is loaded correctly.

---

## 🐞 Troubleshooting

### Symlink Errors
Ensure the symlink points to your `nvimSetup/nvim` directory:
- **Linux:** `ls -l ~/.config/nvim`
- **Windows:** `Get-Item $env:LOCALAPPDATA\nvim`

### Fonts
If Nerd Font not applied → change terminal font to JetBrainsMono Nerd Font

### LSP Errors
If `clangd` is not found, refer to the **LSP Support** section above.

---

## Requirements
Nerd Font compatible terminal

---

## ❤️ Contributions
Pull requests and suggestions are always welcome!
