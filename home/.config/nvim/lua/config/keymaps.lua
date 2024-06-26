-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:p:h<cr> <bar> <cmd>pwd<cr>", { silent = true })
vim.keymap.set("n", "<leader>fd", "<cmd>echo expand('%:p:h')<cr>", { silent = true })
