vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lots of things need this
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- if in vscode then disable all the unneeded stuff
  if (vim.g.vscode == nil) then
    use 'liuchengxu/vista.vim'
    use 'williamboman/nvim-lsp-installer'
    use { 'ray-x/go.nvim', run = function() require('go').setup() end }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    }
    use 'neovim/nvim-lspconfig'
    use 'f-person/git-blame.nvim'
    use 'APZelos/blamer.nvim'
    use {
      'SmiteshP/nvim-navic',
      requires = 'neovim/nvim-lspconfig'
    }
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use 'folke/tokyonight.nvim'
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          context = 20,
          expand = {
            "function",
            "type",
            "method",
            "if_statement",
          },
          dimming = {
            alpha = 0.25,
          }
        }
      end
    }
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'Yggdroot/indentLine'
    use 'windwp/nvim-autopairs'
    --  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    use 'tanvirtin/monokai.nvim'
    use 'morhetz/gruvbox'
    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('gitsigns').setup()
      end,
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-packer.nvim" }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use 'ggandor/lightspeed.nvim'
    use {
      'b3nj5m1n/kommentary',
      config = function()
        require('kommentary.config').use_extended_mappings()
      end,
    }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- quickfix
    use {
      'ten3roberts/qf.nvim',
      config = function()
        require'qf'.setup{}
      end
    }
    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
        end
    }
  use {
      "nvim-neorg/neorg",
      tag = "*",
      config = function()
          require('neorg').setup {
              load = {
                  ["core.defaults"] = {}, -- Loads default behaviour
                  ["core.completion"] = {
                    config = {
                      engine = "nvim-cmp",
                    },
                  },
                  ["core.summary"] = {},
                  ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                        icons = {
                          todo = {
                            done = { icon = "✓" },
                            undone = { icon = "✗" },
                            pending = { icon = "✗" },
                          },
                          heading = {
                            level_1 = { icon = "❖" },
                            level_2 = { icon = "◈" },
                            level_3 = { icon = "⟡" },
                            level_4 = { icon = "◇" },
                            level_5 = { icon = "◆" },
                            level_6 = { icon = "⋄" },
                          }
                        },
                    }
                  },
                  ["core.dirman"] = { -- Manages Neorg workspaces
                      config = {
                          workspaces = {
                              work = "~/notes/work",
                              home = "~/notes/home",
                          },
                          default_workspace = "work",
                          -- open_last_workspace = true
                      },
                  },
              },
          }
      end,
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim",
  }
  end

  -- both in nvim and others
  use { 'mhartington/formatter.nvim' }
  use { 'prettier/vim-prettier',
  run = 'yarn install',
  ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
}
use 'mfussenegger/nvim-lint'


-- use 'kdheepak/lazygit.nvim'
-- use "tversteeg/registers.nvim"
if packer_bootstrap then
  require('packer').sync()
end
end)



