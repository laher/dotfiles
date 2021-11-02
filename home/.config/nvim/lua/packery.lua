-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


-- local cmd = vim.cmd
-- cmd [[packadd packer.nvim]]
-- local packer = require 'packer'

-- Add packages
-- for packages info see: init.lua (Lua modules)
-- return packer.startup(function(use)
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  use 'kyazdani42/nvim-tree.lua'
  use 'Yggdroot/indentLine'
  use 'windwp/nvim-autopairs'
  use 'kyazdani42/nvim-web-devicons'
  use 'liuchengxu/vista.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
  use 'tanvirtin/monokai.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
  if packer_bootstrap then
    require('packer').sync()
  end

end)
