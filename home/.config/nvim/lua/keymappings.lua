-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
vim.keymap.set('n', '<space>', ':nohl<CR>', {silent = true})

-- map Esc to kk
vim.keymap.set('i', 'kk', '<Esc>')

-- fast saving with <leader> and s
vim.keymap.set('n', '<leader>s', ':w<CR>', {silent = true})
-- map('i', '<leader>s', '<C-c>:w<CR>', {silent = true})

-- move around splits using Ctrl + {h,j,k,l}
vim.keymap.set('n', '<C-h>', '<C-w>h', {silent = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {silent = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {silent = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {silent = true})

-- close all windows and exit from neovim
vim.keymap.set('n', '<leader>q', ':quitall<CR>', {silent = true})

-- reload config
vim.keymap.set('n', '<leader>r', ':luafile ~/.config/nvim/init.lua<CR>', {silent = true})

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
if (vim.g.vscode == nil) then
  -- open terminal
  vim.keymap.set('n', '<C-t>', ':Term<CR>')

  -- nvim-tree
  vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true})       -- open/close
  vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', {silent = true}) -- search file

  -- Vista tag-viewer
  -- vim.keymap.set('n', '<C-m>', ':Vista!!<CR>', {silent = true})   -- open/close

  -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = true})
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = true})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = true})

  vim.keymap.set('n', '<C-c>', ':Neorg exec block<CR>', {silent = true})

    local neorg_callbacks = require("neorg.callbacks")
    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
            n = { -- Bind keys in normal mode
       --         { "<C-c>", "external.exec.view" },
            },
        }, {
            silent = true,
            noremap = true,
        })
    end)
end
