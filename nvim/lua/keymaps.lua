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

-- ============================
--  C++ TOOLS
-- ============================

-- nvim-treesitter-cpp-tools
map("v", "<leader>cpd", ":TSCppDefineClassFunc<CR>", { desc = "C++: Generate out-of-class definition", silent = true })
map("n", "<leader>cpc", ":TSCppMakeConcreteClass<CR>", { desc = "C++: Implement pure virtual functions", silent = true })
map("v", "<leader>c3", ":TSCppRuleOf3<CR>", { desc = "C++: Generate Rule of 3", silent = true })
map("v", "<leader>c5", ":TSCppRuleOf5<CR>", { desc = "C++: Generate Rule of 5", silent = true })

-- ============================
--  DAP (Debug)
-- ============================

map("n", "<F5>", function() require("dap").continue() end, { desc = "DAP: Continue" })
map("n", "<F10>", function() require("dap").step_over() end, { desc = "DAP: Step over" })
map("n", "<F11>", function() require("dap").step_into() end, { desc = "DAP: Step into" })
map("n", "<F12>", function() require("dap").step_out() end, { desc = "DAP: Step out" })
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle breakpoint" })
map("n", "<leader>dBe", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional breakpoint" })
map("n", "<leader>dBc", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input("Hit condition: "))
end, { desc = "DAP: Hit condition breakpoint" })
map("n", "<leader>dp", function() require("dap").pause() end, { desc = "DAP: Pause" })
map("n", "<leader>dD", function() require("dap").terminate() end, { desc = "DAP: Terminate" })
map("n", "<leader>dd", function() require("dapui").toggle() end, { desc = "DAP: Toggle UI" })

-- DAP UI auto-open/close on session start/end
vim.api.nvim_create_autocmd("User", {
    pattern = "DapSessionStarted",
    callback = function()
        require("dapui").open()
    end,
})
vim.api.nvim_create_autocmd("User", {
    pattern = "DapSessionEnded",
    callback = function()
        require("dapui").close()
    end,
})
