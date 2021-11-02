

local cr = {}

local api = vim.api

cr.setmark = function(buffer_number, start_line, msg)
  api.nvim_buf_add_highlight(buffer_number, vim.g["ns"], "SpellBad", start_line, 0, -1)
  api.nvim_buf_set_extmark(buffer_number, vim.g["ns"], start_line, 0, {
    virt_text = { { msg } }, virt_text_pos = 'eol'} )
end

cr.hello_extmark = function()
  local buffer_number = api.nvim_get_current_buf()
  cr.setmark(buffer_number, 2, 'hello extmark')
end

cr.clear = function()
  local buffer_number = api.nvim_get_current_buf()
  api.nvim_buf_clear_namespace(buffer_number, vim.g["ns"], 0, -1)
end

--[[ cr.golint = function()
  local buffer_number = api.nvim_get_current_buf()
  local line_number = 10
  cr.setmark(buffer_number, line_number, 'err not handled')
end ]]

cr.golint = function()
  cr.clear()
  local file = assert(io.popen('golangci-lint run --out-format json', 'r'))
  local output = file:read('*all')
  file:close()
  --print(output)
  local data = vim.fn.json_decode(output)
  --print(data["Issues"])
  for k, issue in pairs(data["Issues"]) do
    local buffer_number = api.nvim_get_current_buf()
    local filename = vim.fn.expand('%')
    if (filename == issue["Pos"]["Filename"]) then
      cr.setmark(buffer_number, issue["Pos"]["Line"]-1, issue["Text"])
    end
  end
end

cr.setup = function()
  vim.g["ns"] = api.nvim_create_namespace("golint")

  -- lint on save (NOTE - BufReadPost isn't working right, yet ?!)
  api.nvim_exec([[ autocmd BufWritePre,BufReadPost *.go :silent! lua require('plugins.golint').golint() ]], false)

  -- maybe make some mappings for testing ...
  --[[ local map = vim.api.nvim_set_keymap
  local opts = { noremap=true, silent=true }
  map('n', '<leader>z', "<cmd>lua require'plugins.golint'.hello_extmark()<CR>", opts)
  map('n', '<leader>x', "<cmd>lua require'plugins.golint'.clear()<CR>", opts) ]]
end

-- to initialise this file: require('plugins.golint').setup()
return cr
