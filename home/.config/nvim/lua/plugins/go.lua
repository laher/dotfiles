require('go').setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :setl makeprg=golangci-lint\ run\ --out-format\ tab | :GoMake ]], false)
vim.cmd([[ autocmd BufWritePre *.go :GoLint ]], false)
