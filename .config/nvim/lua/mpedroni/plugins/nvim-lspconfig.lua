return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Helps to install and manage the LSP servers.
        {
            'mason-org/mason.nvim',
            opts = {},
        },
        -- Auto install LSP servers with Mason.
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        'saghen/blink.cmp',
    },
    config = function()
        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            },
            gopls = {
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    },
                },
            },

            ts_ls = {},
            html = {},
            cssls = {},
            jsonls = {},
            yamlls = {},
            dockerls = {},
            docker_compose_language_service = {},
            cmake = {},
            bashls = {},
        }

        local ensure_installed = vim.tbl_keys(servers)
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
            'gofumpt',
            'goimports',
        })

        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        for server, config in pairs(servers) do
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})
            vim.lsp.config(server, config)
        end

        require('mason-lspconfig').setup {
            ensure_installed = {},
            automatic_installation = false,
        }

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config {
            severity_sort = true,
            update_in_insert = true,
            float = { border = 'rounded', source = 'if_many' },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
            },
            virtual_text = {
                source = 'if_many',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        }
    end,
}
