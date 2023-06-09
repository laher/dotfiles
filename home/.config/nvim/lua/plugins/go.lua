return {
  -- go
  {
    'ray-x/go.nvim',
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
      local format_sync_grp = vim.api.nvim_create_augroup("GoImports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
         require('go.format').goimport()
        end,
        group = format_sync_grp,
      })
      local opts = { noremap=true, silent=true }
      -- vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'plugins.golint'.hello_extmark()<CR>", opts)
      -- vim.api.nvim_set_keymap('n', '<leader>x', "<cmd>lua require'plugins.golint'.clear()<CR>", opts)
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  }
}
