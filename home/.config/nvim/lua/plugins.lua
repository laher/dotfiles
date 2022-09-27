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
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {
          -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
          update_focused_file = {
            -- enables the feature
            enable      = true,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd  = true,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = {}
          }

        } end
    }
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

  use 'mfussenegger/nvim-lint'
  -- use 'kdheepak/lazygit.nvim'
  use "tversteeg/registers.nvim"
  if packer_bootstrap then
    require('packer').sync()
  end
end)



