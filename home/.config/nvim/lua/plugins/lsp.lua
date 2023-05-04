return {
    -- mason.nvim
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        cmd = 'Mason',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },
		-- neodev.nvim
    {
      'folke/neodev.nvim',
       config = function()
          require("neodev").setup({
            -- add any options here, or leave empty to use the default settings
          })
       end,
    },

    -- nvim-lspconfig
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            {
                'williamboman/mason-lspconfig.nvim',
                opts = {
                    ensure_installed = {
                        'lua_ls',
                        'clangd',
                        'marksman'
                    }
                }
            },
            'folke/neodev.nvim',
        },
        keys = {
            { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Goto Definition' },
            { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
            { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
            { 'gI', '<cmd>Telescope lsp_implementations<cr>', desc = 'Goto Implementation' },
            { 'gy', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto T[y]pe Definition' },
            { 'K', vim.lsp.buf.hover, desc = 'Hover' },
            { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
        },
        event = {
            'BufReadPre',
            'BufNewFile'
        },
        config = function()
            require("neodev").setup({
              -- add any options here, or leave empty to use the default settings
            })
            local navic = require('nvim-navic')
            local lspconfig = require('lspconfig')
            lspconfig.clangd.setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end,
            })
            lspconfig.lua_ls.setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                                [vim.fn.stdpath('config') .. '/lua'] = true,
                            },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
            lspconfig.marksman.setup({
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end,
            })
        end,
    },

    -- null-ls.nvim
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = 'williamboman/mason.nvim',
        event = {
            'BufReadPre',
            'BufNewFile',
        },
        opts = function()
            local nls = require('null-ls')
            return {
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.markdownlint,
                    nls.builtins.diagnostics.markdownlint,
                    nls.builtins.diagnostics.luacheck,
                }
            }
        end,
    },
}
