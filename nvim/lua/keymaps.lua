-- ============================
--  GLOBAL KEYMAPS
-- ============================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files", silent = true })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live grep", silent = true })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers", silent = true })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help tags", silent = true })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope: Recent files", silent = true })
map("n", "<leader>fw", builtin.grep_string, { desc = "Telescope: Grep string under cursor", silent = true })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope: Workspace diagnostics", silent = true })
-- map("n", "<leader>gB", builtin.git_branches, { desc = "Telescope: Git branches", silent = true })

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
