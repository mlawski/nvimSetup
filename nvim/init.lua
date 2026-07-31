vim.g.mapleader = " "
vim.loader.enable(false) -- Lua bytecode cache for faster startup - set to true on Linux

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup "plugins"

require "options"
require "keymaps"
require "lsp"

-- Auto-load project-local .nvim-dap.lua once per Neovim session
local dap_loaded = false

vim.api.nvim_create_autocmd({ "VimEnter", "SessionLoadPost" }, {
    group = vim.api.nvim_create_augroup("DapProjectLoad", { clear = true }),
    callback = function()
        if dap_loaded then
            return
        end
        local f = root_dap_file or (vim.fn.getcwd() .. "/.nvim-dap.lua")
        if vim.fn.filereadable(f) == 1 then
            vim.cmd("source " .. f)
            dap_loaded = true
        end
    end,
})
