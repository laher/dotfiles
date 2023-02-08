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
    use { 'hrsh7th/nvim-cmp',
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
  end

  -- both in nvim and others

  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  --  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  use 'tanvirtin/monokai.nvim'
  use 'morhetz/gruvbox'
  use { 'lewis6991/gitsigns.nvim',
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
  use { 'b3nj5m1n/kommentary',
    config = function()
      require('kommentary.config').use_extended_mappings()
    end,
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'mhartington/formatter.nvim' }
  use { 'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
  }
  use 'mfussenegger/nvim-lint'

  use {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      local function db_completion()
        require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
      end

      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
          "mysql",
          "plsql",
        },
        callback = function()
          vim.schedule(db_completion)
        end,
      })

    end,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  }

  -- use 'kdheepak/lazygit.nvim'
  -- use "tversteeg/registers.nvim"
  if packer_bootstrap then
    require('packer').sync()
  end
end)



