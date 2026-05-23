-- ============================
--  LSP CONFIG (Neovim 0.11+)
-- ============================

-- 1. Capabilities integration with nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 2. on_attach – buffer-local keymaps
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end

-- 3. LSP servers
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("jsonls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("yamlls", {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config("bashls", {
    capabilities = capabilities,
    on_attach = on_attach,
})
