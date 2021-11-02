require('go').setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :setl makeprg=golangci-lint\ run\ --out-format\ tab | :GoMake ]], false)
-- vim.cmd([[ autocmd BufWritePre *.go :GoLint ]], false)


local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<leader>z', "<cmd>lua require'plugins.golint'.hello_extmark()<CR>", opts)
map('n', '<leader>x', "<cmd>lua require'plugins.golint'.clear()<CR>", opts)
-- map('n', '<leader>c', "<cmd>lua require'plugins.golint'.golint()<CR>", opts)
