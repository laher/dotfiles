--[[

  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
-- require('plugins')

vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = ";" -- Make sure to set `mapleader` before lazy so your mappings are correct

-- require("lazy").setup({
--  "folke/which-key.nvim",
--  { "folke/neoconf.nvim", cmd = "Neoconf" },
--  "folke/neodev.nvim",
-- })

local opts = {
    ui = {
        custom_keys = { false }
    },
    install = {
        colorscheme = { 'tokyonight' }
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
                'rplugin',
                'editorconfig',
            }
        }
    }
}

-- Load the plugins and options
require('lazy').setup('plugins', opts)

require('settings')
require('keymappings')
require('esp')
