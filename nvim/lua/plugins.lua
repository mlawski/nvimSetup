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
                integration = {
                    bufferline = true,
                }
            }

            local ok_colorscheme = pcall(vim.cmd.colorscheme, "catppuccin")
            if not ok_colorscheme then
                vim.notify("Failed to load catppuccin colorscheme", vim.log.levels.ERROR)
            end
        end,
    },

    -- Bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons"},
        config = function ()
            require("bufferline").setup {}
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

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup {}
            telescope.load_extension("fzf")
        end,
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
            if ok then
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
            end

            -- Register FASTBuild as a custom parser (bypasses the "supported languages" list)
            vim.api.nvim_create_autocmd("User", {
                pattern = "TSUpdate",
                callback = function()
                    require("nvim-treesitter.parsers").fastbuild = {
                        install_info = {
                            url = "https://github.com/pinbraerts/tree-sitter-fastbuild.git",
                            branch = "main",
                            files = { "src/parser.c", "src/scanner.c" },
                            generate_requires_npm = false,
                            requires_generate_from_grammar = false,
                        },
                    }
                end,
            })

            local install_ok, ts = pcall(require, "nvim-treesitter")
            if install_ok then
                ts.install { "fastbuild" }
            end

            -- Explicitly start treesitter highlighting for fastbuild files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "fastbuild",
                callback = function()
                    pcall(vim.treesitter.start)
                    print("ts started")
                end,
            })
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

    -- DAP adapters via Mason
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-nvim-dap").setup {
                ensure_installed = { "codelldb", "python" },
                handlers = {},
            }
        end,
    },

    -- DAP core
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup {}
            require("nvim-dap-virtual-text").setup { commented = true }

            -- Lua
            dap.adapters.nlua = function(callback, config)
                callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or "8086" })
            end
            dap.configurations.lua = {
                {
                    type = "nlua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                    port = 8086,
                },
            }

            -- C/C++
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = (function()
                        local p = vim.fn.exepath("codelldb")
                        if p ~= "" then
                            return p
                        end
                        return vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb")
                    end)(),
                    args = { "--port", "${port}" },
                },
            }

            -- GDB
            dap.adapters.gdb = {
                id = "gdb",
                type = "executable",
                command = "gdb",
                args = { "--quiet", "--interpreter=dap" },
            }

            for _, lang in ipairs({ "c", "cpp" }) do
                dap.configurations[lang] = {
                    {
                        type = "codelldb",
                        request = "launch",
                        name = "Debug exe",
                        program = function()
                            local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                            return #path > 0 and path or nil
                        end,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "codelldb",
                        request = "attach",
                        name = "Attach to process",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

        end,
    },

    -- C++ Assist (generate definition from declaration and vice versa)
    {
        "Badhi/nvim-treesitter-cpp-tools",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "cpp", "c" },
        config = function()
            require("nt-cpp-tools").setup({
                preview = {
                    quit = "q", -- Key to exit the preview
                    accept = "<Tab>", -- Key to accept the generated code
                },
                header_extension = "h",
                source_extension = "cpp",
                custom_define_class_function_commands = {
                    TSCppImplWrite = {
                        output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
                    },
                },
            })
        end,
    },

}
