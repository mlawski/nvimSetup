# 🅽 nvimSetup

Personal Neovim configuration designed to work on both **Windows** and **Linux**.  
This repository contains:

- full Neovim config (`nvim/`)
- automatic installer for Linux (`install_linux.sh`)
- automatic installer for Windows (`install_windows.ps1`)
- symlink creation (so Neovim always loads this repo as its config)
- installation of required CLI tools (ripgrep, fd, fzf)
- plugin management via **lazy.nvim**
- ready-to-use IDE setup for **C++**, **Lua**, **Python**, and **FASTBuild** (`.bff`)
- **DAP** debugging support for **C/C++** (`codelldb`) and **Python** (`debugpy`) via `nvim-dap` / `nvim-dap-ui`
- **Mason** for easy management of LSP servers, DAP adapters, linters, and formatters

---

## 📁 Repository structure

- `nvim/`: The main Neovim configuration directory.
  - `init.lua`: Entry point for the Neovim configuration.
  - `lua/`: Contains modular Lua configurations.
    - `options.lua`: Centralizes all Neovim settings.
    - `keymaps.lua`: Custom keybindings.
    - `plugins.lua`: Configuration for plugin management.
    - `lsp.lua`: LSP (Language Server Protocol) setup.
    - `utils.lua`: Helper functions (safe require, keymap wrapper, OS detection).
- `install_linux.sh`: Shell script for automated installation on Linux systems.
- `install_windows.ps1`: PowerShell script for automated installation on Windows systems.

---

# 🚀 Features

- **lazy.nvim** plugin manager (auto‑bootstrap)
- **Mason** for managing LSP, DAP, linters, and formatters
- **LSP Support** for:
  - C / C++ (`clangd`)
  - Lua (`lua_ls`)
  - Python (`pyright`)
- **C++ Development Tools**:
  - Out-of-class definition and Rule of 3/5 generation via **nvim-treesitter-cpp-tools**
  - Native header/source file switching via `clangd`
- **Telescope** (with native FZF speedup) for fast file and buffer navigation
- **nvim-cmp** for autocompletion
- **Nerd Fonts auto-install**
- **Debug Adapter Protocol (DAP)** for C/C++ and Python with `nvim-dap` + `nvim-dap-ui`
- **Automatic LSP and formatter installation** via Mason Tool Installer
- **neo-tree** file explorer
- **Treesitter** for advanced syntax highlighting and code structure
- **FASTBuild** (`.bff`) support via custom tree-sitter parser with query-based syntax highlighting
- **conform.nvim** for multi-language formatting (`clang-format`, `stylua`, `black`, `prettier`)
- **gitsigns** for inline Git blame and hunk management
- **vim-fugitive + diffview** for advanced Git integration
- **lualine** statusline
- **catppuccin** theme (Mocha flavor)
- **Markdown support** with live preview (`markdown-preview.nvim`)
- Works seamlessly on:
  - Windows 11
  - Linux (Ubuntu, Fedora, Arch, etc.)
- Fully portable — clone repo, run installer, done!

---

# 🪟 Windows installation

Requires PowerShell 7+.

```powershell
git clone https://github.com/mlawski/nvimSetup
cd nvimSetup
powershell -ExecutionPolicy Bypass -File install_windows.ps1
```

This will:
- create a symlink at `%LOCALAPPDATA%\nvim` -> `nvimSetup\nvim`
- install tools via Scoop (if available):
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
- clone & link `tree-sitter-fastbuild` queries into `nvim/after/queries/fastbuild`
- prepare Neovim for first launch

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
- clones `tree-sitter-fastbuild` and creates symlinks in `nvim/after/queries/fastbuild`

Once the installer finishes, simply run:
```
nvim
```
`lazy.nvim` will automatically bootstrap itself and install all required plugins.

---

## 🔧 Requirements

- **Neovim** 0.9+ (0.10+ recommended)
- **Git**
- A **Nerd Font** compatible terminal (e.g., JetBrainsMono Nerd Font)

---

## ⌨️ Keybindings

**Note:** The `<leader>` key is set to `Space`.

### General & Navigation
| Action | Key |
| :--- | :--- |
| Find files | `<leader>ff` |
| Live grep | `<leader>fg` |
| Buffers | `<leader>fb` |
| Help tags | `<leader>fh` |
| Recent files | `<leader>fo` |
| Grep string under cursor | `<leader>fw` |
| Workspace diagnostics | `<leader>fd` |
| Toggle Neotree | `<leader>e` |
| Next buffer | `<Tab>` |
| Previous buffer | `<S-Tab>` |
| Close buffer | `<leader>c` |

### LSP & Diagnostics
| Action | Key |
| :--- | :--- |
| LSP Hover | `K` |
| Go to Definition | `gd` |
| Go to References | `gr` |
| Go to Implementation | `gi` |
| Rename symbol | `<leader>rn` |
| Code Action | `<leader>ca` |
| Format buffer | `<leader>f` |
| Show Diagnostic float | `<leader>d` |
| Prev Diagnostic | `[d` |
| Next Diagnostic | `]d` |
| Switch source/header (.h/.cpp) | `<leader>lh` |

### C++ Tools
| Action | Key | Mode |
| :--- | :--- | :--- |
| Generate out-of-class definition | `<leader>cpd` | Visual |
| Implement pure virtual functions | `<leader>cpc` | Normal |
| Generate Rule of 3 | `<leader>c3` | Visual |
| Generate Rule of 5 | `<leader>c5` | Visual |
| Funcy: Function operations | `<leader>cf` | Normal |

### Git & Diffview
| Action | Key |
| :--- | :--- |
| Git status | `<leader>gs` |
| Git commit | `<leader>gc` |
| Git push | `<leader>gp` |
| Git blame | `<leader>gb` |
| Git diff split | `<leader>gf` |
| Open Diffview | `<leader>dv` |
| Close Diffview | `<leader>dc` |
| File history | `<leader>dh` |

### Debug (DAP)
| Action | Key |
| :--- | :--- |
| Start/Continue | `F5` |
| Step over | `F10` |
| Step into | `F11` |
| Step out | `F12` |
| Toggle breakpoint | `<leader>db` |
| Conditional breakpoint | `<leader>dBe` |
| Hit condition breakpoint | `<leader>dBc` |
| Pause | `<leader>dp` |
| Terminate | `<leader>dD` |
| Toggle DAP UI | `<leader>dd` |

### Markdown
| Action | Key |
| :--- | :--- |
| Markdown Preview Start | `<leader>mp` |
| Markdown Preview Stop | `<leader>ms` |

---

## 🛠️ LSP Support

### C / C++
Uses `clangd` for diagnostics, completion, and source/header navigation. Formatted automatically with `clang-format`.

### Lua
Uses `lua_ls` (Lua Language Server). Formatted automatically with `stylua`.

### Python
Uses `pyright` for type checking and IntelliSense. Formatted automatically with `black`.

### FASTBuild (`.bff`)
Syntax highlighting powered by a custom tree-sitter parser (`tree-sitter-fastbuild`). Installed automatically during setup via both the Linux and Windows installers.

---

## 🧪 First Launch & Setup

1. Run `nvim`.
2. Wait for `lazy.nvim` and `mason-tool-installer` to finish downloading plugins and language servers.
3. Restart Neovim to ensure everything is loaded correctly.

---

## 🐞 Troubleshooting

### Symlink Errors
Ensure the symlink points to your `nvimSetup/nvim` directory:
- **Linux:** `ls -l ~/.config/nvim`
- **Windows:** `Get-Item $env:LOCALAPPDATA\nvim`

### Fonts
If icons look broken or squares appear -> configure your terminal emulator to use **JetBrainsMono Nerd Font** (or any compatible Nerd Font).

### LSP Errors
If `clangd`, `lua_ls`, or `pyright` are not found, run `:Mason` inside Neovim to check their installation status, or rerun your system installation script.
