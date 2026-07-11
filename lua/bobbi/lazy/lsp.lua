return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "omnisharp",
                "ts_ls",
                "clangd",
                "cssls",
                "emmet_language_server",
                "sqls"
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
                ["omnisharp"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.omnisharp.setup({
                        capabilities = capabilities,
                        cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
                        enable_roslyn_analyzers = true,
                        organize_imports_on_format = true,
                        enable_import_completion = true,
                        on_attach = function(client, bufnr)
                            -- Format on save
                            vim.api.nvim_create_autocmd("BufWritePre", {
                                buffer = bufnr,
                                callback = function()
                                    vim.lsp.buf.format({ async = false })
                                end,
                            })

                            -- Manual format keymap
                            vim.keymap.set("n", "<leader>f", function()
                                vim.lsp.buf.format()
                            end, { buffer = bufnr, desc = "Format with OmniSharp" })
                        end,
                    })
                end,
                ["sqls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.sqls.setup {
                        capabilities = capabilities,
                        settings = {
                            sqls = {
                                connections = {
                                    {
                                        driver = 'postgresql',
                                        dataSourceName = 'host=127.0.0.1 port=5432 user=bobbi password=malko29zlo dbname=bobbidb sslmode=disable',
                                    },
                                },
                            },
                        },
                    }
                end,
                ["ts_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            -- This explicitly tells Neovim to use the LSP when you press `=`
                            vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

                            -- Optional: Add a manual format keymap just like your C# setup
                            vim.keymap.set("n", "<leader>f", function()
                                vim.lsp.buf.format()
                            end, { buffer = bufnr, desc = "Format with ts_ls" })
                        end,
                    })
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
