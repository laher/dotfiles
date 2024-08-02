-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.cmd("set whichwrap+=<,>,[,],h,l") -- right-arrow goes to next line
vim.cmd("set relativenumber!") -- off. or `set rnu!`

-- General/Global LSP Configuration
local make_client_capabilities = vim.lsp.protocol.make_client_capabilities
function vim.lsp.protocol.make_client_capabilities()
  local caps = make_client_capabilities()
  if not (caps.workspace or {}).didChangeWatchedFiles then
    vim.notify("lsp capability didChangeWatchedFiles is already disabled", vim.log.levels.WARN)
  else
    caps.workspace.didChangeWatchedFiles = nil
  end

  return caps
end
