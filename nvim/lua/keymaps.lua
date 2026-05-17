local map = vim.keymap.set

-- fzf-lua
map("n", "<leader>ff", function() require("fzf-lua").files() end)
map("n", "<leader>fg", function() require("fzf-lua").live_grep() end)
map("n", "<leader>fb", function() require("fzf-lua").buffers() end)

-- neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>")

-- buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")
map("n", "<leader>c", ":bd<CR>")

-- LSP
map("n", "K", vim.lsp.buf.hover)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gr", vim.lsp.buf.references)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<leader>f", function() vim.lsp.buf.format() end)
