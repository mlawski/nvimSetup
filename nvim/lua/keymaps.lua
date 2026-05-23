-- ============================
--  GLOBAL KEYMAPS
-- ============================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- fzf-lua
local fzf = require "fzf-lua"
map("n", "<leader>ff", fzf.files, opts)
map("n", "<leader>fg", fzf.live_grep, opts)
map("n", "<leader>fb", fzf.buffers, opts)

-- neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- buffers
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>c", ":bd<CR>", opts)

-- Fugitive
map("n", "<leader>gs", ":G<CR>", { desc = "Git status" }, opts)
map("n", "<leader>gc", ":G commit<CR>", { desc = "Git commit" }, opts)
map("n", "<leader>gp", ":G push<CR>", { desc = "Git push" }, opts)
map("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" }, opts)
map("n", "<leader>gf", ":Gdiffsplit<CR>", { desc = "Git diff split" }, opts)

-- Diffview
map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Open Diffview" }, opts)
map("n", "<leader>dc", ":DiffviewClose<CR>", { desc = "Close Diffview" }, opts)
map("n", "<leader>dh", ":DiffviewFileHistory<CR>", { desc = "File history" }, opts)

-- MarkdownPreview
map("n", "<leader>mp", ":MarkdownPreview<CR>", { desc = "Markdown Preview" })
map("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { desc = "Markdown Preview Stop" })
