return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
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
    end
  },

  {
    'folke/neodev.nvim',
     config = function()
        require("neodev").setup({})
     end,
  },


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
