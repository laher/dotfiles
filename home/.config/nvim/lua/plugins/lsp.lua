return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    cmd = {
      'Mason',
    },
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    keys = {
      { 'gd', vim.lsp.buf.definition, desc = 'Goto Definition' },
      { 'gr', vim.lsp.buf.references, desc = 'References' },
      { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
      { 'gI', vim.lsp.buf.implementation, desc = 'Goto Implementation' },
      { 'gy', vim.lsp.buf.type_definition, desc = 'Goto T[y]pe Definition' },
      { '<leader>rn', vim.lsp.buf.rename, desc = 'Rename' },
      { '<leader>co', vim.lsp.buf.code_action, desc = 'Code Action' },
      { '<leader>e', vim.lsp.buf.show_line_diagnostics, desc = 'Show line diagnostics' },
      { '[d', vim.lsp.diagnostic.goto_prev, desc = 'Goto prev diagnostic' },
      { ']d', vim.lsp.diagnostic.goto_next, desc = 'Goto next diagnostic' },
      { '<localleader>f', vim.lsp.buf.format, desc = 'LSP format' },
      { 'K', vim.lsp.buf.hover, desc = 'Hover' },
      { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature Help' },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup()
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
          require("rust-tools").setup {}
        end
      }
    end
  },

  {
    'folke/neodev.nvim',
    config = function()
      -- config available
      require("neodev").setup({})
    end,
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    config = function()
      local lsp_lines = require('lsp_lines')
      lsp_lines.setup()
      vim.keymap.set('', '<leader>l', lsp_lines.toggle, { desc = 'Toggle lsp_lines' })
      vim.diagnostic.config({
        virtual_text = false
      })
    end,
  }


  -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     dependencies = 'williamboman/mason.nvim',
    --     event = {
      --         'BufReadPre',
      --         'BufNewFile',
      --     },
      --     opts = function()
        --         local nls = require('null-ls')
        --         return {
          --             sources = {
            --                 nls.builtins.formatting.stylua,
            --                 nls.builtins.formatting.markdownlint,
            --                 nls.builtins.diagnostics.markdownlint,
            --                 nls.builtins.diagnostics.luacheck,
            --             }
            --         }
            --     end,
            -- },
          }
