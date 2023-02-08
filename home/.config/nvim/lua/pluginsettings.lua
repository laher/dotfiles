
require('go').setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :setl makeprg=golangci-lint\ run\ --out-format\ tab | :GoMake ]], false)
-- vim.cmd([[ autocmd BufWritePre *.go :GoLint ]], false)


local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<leader>z', "<cmd>lua require'plugins.golint'.hello_extmark()<CR>", opts)
map('n', '<leader>x', "<cmd>lua require'plugins.golint'.clear()<CR>", opts)
-- map('n', '<leader>c', "<cmd>lua require'plugins.golint'.golint()<CR>", opts)

require'nvim-treesitter.configs'.setup {

  -- A list of parser names, or "all"
  ensure_installed = { "javascript", "lua", "go" },


  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["ac"] = "@comment.outer",
        ["ic"] = "@comment.inner",
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

      },
    },
  },
}

if (vim.g.vscode == nil) then
  vim.g.nvim_tree_width_allow_resize  = 1

  require("telescope").load_extension "packer"
  require("telescope").load_extension "file_browser"

  require('telescope').setup{
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
  --    path_display.shorten = 1,
      path_display = {
        truncate = 3
      },
      mappings = {
        i = {
          -- map actions.which_key to <C-h> (default: <C-/>)
          -- actions.which_key shows the mappings for your picker,
          -- e.g. git_{create, delete, ...}_branch for the git_branches picker
          ["<C-h>"] = "which_key"
        }
      }
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- }
      -- Now the picker_config_key will be applied every time you call this
      -- builtin picker
    },
    extensions = {
      -- Your extension configuration goes here:
      -- extension_name = {
      --   extension_config_key = value,
      -- }
      -- please take a look at the readme of the extension you want to configure
    }
  }


  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- path_display={"truncate"}

  local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>fl', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>fu', "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
  vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
  -- vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').file_browser()<cr>", opts)
  vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope file_browser", opts)


  -- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
  -- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
  -- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        --vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      -- { name = 'vsnip' },

      -- For luasnip user.
      { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

  vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
end
