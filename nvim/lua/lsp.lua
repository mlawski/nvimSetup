-- Capabilities for nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- C/C++
vim.lsp.config("clangd", {
    capabilities = capabilities,
})

-- Python
vim.lsp.config("pyright", {
    capabilities = capabilities,
})

-- Enable the configured LSP servers
vim.lsp.enable { "lsp_lua", "clangd", "pyright" }
