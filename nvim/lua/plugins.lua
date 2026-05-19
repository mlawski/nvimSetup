return {
    -- Lazy
    {
        "folke/lazy.nvim",
        lazy = false,
        priority = 1000,
    },

    -- Colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                window = { position = "right", width = 32 },
                filesystem = { follow_current_file = true },
            })
        end,
    },

    -- fzf-lua
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Git: Fugitive
    {
        "tpope/vim-fugitive",
    },

    -- Git: Diffview
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            local ok, configs = pcall(require, "nvim-treesitter.configs")
            if not ok then
                return
            end

            configs.setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "pyright" },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function ()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "stylua",
                    "clang-format",
                    "black",
                    "prettier",
                },
                auto_update = false,
                run_on_start = true,
            })
        end,
    },

    -- nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = "nvim_lsp" },
                },
            })
        end,
    },

    -- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = { theme = "catppuccin" },
            })
        end,
    },

    -- conform (formatting)
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    cpp = { "clang-format" },
                    c = { "clang-format" },
                    python = { "black" },
                    markdown = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                },
            })
        end,
    },

    -- autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- MarkdownPreview
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = "cd app && npm install",
        config = function()
            vim.g.mkdp_auto_start = 0
        end,
    }
}
