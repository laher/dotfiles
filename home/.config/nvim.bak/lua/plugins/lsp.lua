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
      { 'K', vim.lsp.buf.hover, desc = 'LSP Hover' },
      { '<C-k>', vim.lsp.buf.signature_help, desc = 'Signature Help' },
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
       --   vim.notify('configuring LSP: ' .. server_name)
          require("lspconfig")[server_name].setup {}
        --  vim.notify('done configuring LSP: ' .. server_name)
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
          require("rust-tools").setup {}
        end,

        -- ["gopls"] = function ()
        --   vim.notify('configuring gopls - in here')
        --   require('lspconfig').gopls.setup({
        --     settings = {
        --       gopls = {
        --         gofumpt = true,
        --         ["formatting.gofumpt"] = true,
        --         ["local"] = 'github.com/stqry', -- this gets overridden somehow :( I'm not sure where it happens
        --       }
        --     }
        --   })
        -- end

      }
      require("mason-lspconfig").setup { ensure_installed = { "lua_ls", "gopls" } }

     -- vim.notify('configuring gopls - out here')
     -- require('lspconfig').gopls.setup({
     --   settings = {
     --     gopls = {
     --       gofumpt = true,
     --       ["formatting.local"] = 'github.com/stqry',
     --       ["local"] = 'github.com/stqry',
     --     }
     --   }
     -- })
     -- vim.notify('configuring gopls - done')

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          local lspc = require('lspconfig')
          -- local keys = ''
          -- for k in pairs(lspc.gopls.manager.config.settings.gopls) do
          --   keys = keys .. k .. ', '
          -- end
          -- vim.notify(keys)
          -- override settings
          lspc.gopls.manager.config.settings.gopls['local'] = 'github.com/stqry'
          -- vim.notify(vim.inspect(lspc.gopls.manager.config.settings.gopls['local']))
          local params = vim.lsp.util.make_range_params()
          params.context = {only = {"source.organizeImports"}}
          local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
          for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
              if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
              end
            end
          end
          vim.lsp.buf.format({async = false})
        end
      })
    end
  },

  {
    'folke/neodev.nvim',
    config = function()
      -- config available
      require("neodev").setup({})
    end,
  },

  -- show virtual lines rather than virtual text
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
  },

  -- dim unused
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    branch = 'v2',
    opts = {
      alpha = 0.75,
      blend_color = '#000000',
      update_in_insert = {
        enable = true,
        delay = 100,
      },
      hide = {
        virtual_text = true,
        signs = true,
        underline = true,
      },
    },
  },
  {
    'rmagatti/goto-preview',
    keys = {
      { 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", desc = "Preview definition" },
      { 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>", desc = "Preview References" },
-- nnoremap gpt <cmd>lua require('goto-preview').goto_preview_type_definition()<CR>
-- nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
-- nnoremap gpD <cmd>lua require('goto-preview').goto_preview_declaration()<CR>
-- nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>
    },
    config = function()
      require('goto-preview').setup {}
    end
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
