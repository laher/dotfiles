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
                        'marksman',
                        'gopls',
                        'tsserver',
                    }
                }
            },
            'folke/neodev.nvim',
        },
        keys = {
            { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
            { 'gr', vim.lsp.buf.references, desc = 'References' },
            { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
            { 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
            { 'gy', vim.lsp.buf.type_definition, desc = 'Goto T[y]pe Definition' },
            { '<leader>rn', vim.lsp.buf.rename, desc = 'Rename' },
            { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
            { '<leader>e', vim.lsp.buf.show_line_diagnostics, desc = 'Show line diagnostics' },
            { '[d', vim.lsp.diagnostic.goto_prev, desc = 'Goto prev diagnostic' },
            { ']d', vim.lsp.diagnostic.goto_next, desc = 'Goto next diagnostic' },
            { '<localleader>f', vim.lsp.buf.format, desc = 'LSP format' },
            { 'K', vim.lsp.buf.hover, desc = 'Hover' },
            { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature Help' },
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

            local on_attach = function(client, bufnr)
              -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

              -- Enable completion triggered by <c-x><c-o>
              buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

              if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
              end
              -- compl.on_attach()
            end

            -- lspconfig.lua_ls.setup{
            --     on_attach = function(client, bufnr)
            --       client.server_capabilities.documentFormattingProvider = false
            --       vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            --               vim.lsp.diagnostic.on_publish_diagnostics, {
            --                 -- disable virtual text
            --                 virtual_text = false,
            --
            --                 -- show signs
            --                 signs = true,
            --
            --                 -- delay update diagnostics
            --                 update_in_insert = false,
            --               }
            --             )
            --
            --       if client.server_capabilities.documentSymbolProvider then
            --         navic.attach(client, bufnr)
            --       end
            --     end,
            --     settings = {
            --         Lua = {
            --             runtime = {
            --               version = 'LuaJIT',
            --             },
            --             diagnostics = {
            --                 enable = false,
            --                 globals = { 'vim' },
            --             },
            --             workspace = {
            --                 library = {
            --                   library = vim.api.nvim_get_runtime_file("", true),
            --                 },
            --             },
            --             telemetry = {
            --                 enable = false,
            --             },
            --         },
            --     },
            --     flags = {
            --       debounce_text_changes = 150,
            --     }
            -- }

            -- Use a loop to conveniently call 'setup' on multiple servers and
            -- map buffer local keybindings when the language server attaches
            local servers = { 'pyright', 'gopls', 'tsserver', 'vuels', 'jsonls', 'marksman', 'clangd' }
            for _, lsp in ipairs(servers) do
              lspconfig[lsp].setup {
                on_attach = on_attach,
                flags = {
                  debounce_text_changes = 150,
                }
              }
            end

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
