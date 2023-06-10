return {

  -- oil.nvim
  {
    'stevearc/oil.nvim',
    opts = {},
    cmd = {
      'Oil',
    },
    keys = {
      { '<leader>-', ':vs %:h<cr>', desc = "Open parent directory in vertical split" },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        -- default_file_explorer = true,
      })
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = 'NvimTreeToggle',
    keys = {
      -- { '<leader>z', ':lua require("nvim-tree.api").tree.toggle()<cr>', desc = 'Toggle tree' },
      { '<leader>z', ':NvimTreeToggle<CR>', desc = 'Toggle tree' },
    },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = '',
          info = '',
          warning = '',
          error = '',
        },
      },
      renderer = {
        root_folder_modifier = ':t',
        icons = {
          glyphs = {
            git = {
              unstaged = '✗',
              staged = '✓',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
      filters = {
        custom = { '^.git$' },
      },
      update_focused_file = {
        enable = true,
        update_cwd = true
      }
    },
  },
}
