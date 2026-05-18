local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

opt.list = true
opt.listchars = {
    tab = "→ ",
    space = "·",
    trail = "•",
}

opt.clipboard = "unnamedplus"
