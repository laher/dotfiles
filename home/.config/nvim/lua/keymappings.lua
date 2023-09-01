-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------
vim.cmd[[cnorea wd w\|bd]]

-- leader
-- clear search highlighting
vim.keymap.set("n", "<leader>n", ":nohl<CR>", { silent = true })
-- fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true })
-- close all windows and exit from neovim
vim.keymap.set("n", "<leader>q", ":quitall<CR>", { silent = true })

-- reload config
vim.keymap.set("n", "<leader>rl", ":luafile $MYVIMRC<CR>", { silent = true })
-- open terminal
vim.keymap.set("n", "<leader>t", ":Term<CR>")
-- nvim-tree
-- vim.keymap.set("n", "<leader>z", ":NvimTreeToggle<CR>", { silent = true }) -- open/close
-- vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>", { silent = true }) -- search file
-- map('i', '<leader>s', '<C-c>:w<CR>', {silent = true})

-- move around splits using Ctrl + {h,j,k,l}
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- map kk to Esc
vim.keymap.set("i", "kk", "<Esc>")

-- reinstates the netrw keymapping (I disabled netrw)
vim.keymap.set("n", "<leader>gf", ":e <c-r><c-a><CR>", { silent = true })
local vscode = function()
  local command = string.format([[code --goto "%s:%s"]], vim.fn.expand('%'), vim.fn.line('.'))
  vim.fn.jobstart(command, { detach = true }) -- detach: dont try to manage the process. just start and exit
end
vim.keymap.set("n", "<leader>ko", vscode, { silent = true })
-- vim.keymap.set("n", "<leader>gv", [[:!code --goto join('"', expand('%'), ':', line('.'), '"')<CR>]], { silent = true })

-- Vista tag-viewer
-- vim.keymap.set('n', '<C-m>', ':Vista!!<CR>', {silent = true})   -- open/close

-- not really a mapping
vim.g.neovide_input_macos_alt_is_meta = true
