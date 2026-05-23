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
        lazy = false,
        priority = 1000,
        config = function()
            local ok, catppuccin = pcall(require, "catppuccin")
            if not ok then
                vim.notify("Catppuccin not installed. Run :Lazy sync", vim.log.levels.WARN)
                return
            end

            catppuccin.setup {
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                transparent_background = false,
            }

            local ok_colorscheme = pcall(vim.cmd.colorscheme, "catppuccin")
            if not ok_colorscheme then
                vim.notify("Failed to load catppuccin colorscheme", vim.log.levels.ERROR)
            end
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
            require("neo-tree").setup {
                window = { position = "right", width = 32 },
                filesystem = {
                    follow_current_file = {
                        enabled = true,
                    },
                    filtered_items = {
                        visible = true, -- show hidden
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                },
            }
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

            configs.setup {
                ensure_installed = {
                    "lua",
                    "vim",
                    "vimdoc",
                    "c",
                    "cpp",
                    "python",
                    "markdown",
                    "markdown_inline",
                },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end,
    },

    {
        "neovim/nvim-lspconfig",
    },

    -- LSP
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls", "clangd", "pyright" },
                automatic_enable = false,
            }
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup {
                ensure_installed = {
                    "stylua",
                    "clang-format",
                    "black",
                    "prettier",
                },
                auto_update = false,
                run_on_start = true,
            }
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
        dependencies = { "catppuccin" },
        config = function()
            require("lualine").setup {
                options = {
                    theme = "auto",
                },
            }
        end,
    },

    -- conform (formatting)
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup {
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
            }
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
    },
}
