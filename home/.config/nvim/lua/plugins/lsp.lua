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

            local on_attach = function(client, bufnr)
              -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
              local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

              -- Enable completion triggered by <c-x><c-o>
              buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

              -- Mappings.
              -- local opts = { noremap=true, silent=true }
              -- See `:help vim.lsp.*` for documentation on any of the below functions
              -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
              -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
              -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
              -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
              -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
              -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
              -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
              -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
              -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
              -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
              -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
              -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references({includeDelcaration = false})<CR>', opts)
              -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
              -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
              -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
              -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
              -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
              -- buf_set_keymap('n', 's', '<cmd>lua vim.lsp.buf.stop()<CR>', opts)
              --
              if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
              end
              -- compl.on_attach()
            end
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
