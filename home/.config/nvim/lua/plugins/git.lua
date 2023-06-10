return {
  {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  },

  -- gitlinker
  {
      'ruifm/gitlinker.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
      event = {
          'BufReadPost',
          'BufNewFile'
      },
      config = function()
        require'gitlinker'.setup()
        --vim.api.nvim_set_keymap('v', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {})
        -- vim.api.nvim_set_keymap('v', '<leader>gb', '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = function(url) vim.notify(url) end})<cr>', {})
      end,
  },

  --   -- gx
  --    {
  --   "chrishrb/gx.nvim",
  --   event = { "BufEnter" },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --
  --   -- you can specify also another config if you want
  --   config = function() require("gx").setup {
  --     -- open_browser_app = "os_specific", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
  --     -- open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
  --     handlers = {
  --       plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
  --       github = true, -- open github issues
  --       package_json = true, -- open dependencies from package.json
  --       search = true, -- search the web/selection on the web if nothing else is found
  --     },
  --     handler_options = {
  --       search_engine = "google", -- you can select between google, bing and duckduckgo
  --     },
  --   } end,
  -- },

  {
    'lewis6991/gitsigns.nvim',
    ft = 'gitcommit',
    init = function()
        -- load gitsigns only when a git file is opened
        vim.api.nvim_create_autocmd({ 'BufRead' }, {
            group = vim.api.nvim_create_augroup('GitSignsLazyLoad', { clear = true }),
            callback = function()
                vim.fn.system('git -C ' .. '"' .. vim.fn.expand('%:p:h').. '"' .. ' rev-parse')
                if vim.v.shell_error == 0 then
                    vim.api.nvim_del_augroup_by_name 'GitSignsLazyLoad'
                    vim.schedule(function()
                        require('lazy').load { plugins = { 'gitsigns.nvim' } }
                    end)
                end
            end,
        })
    end,
    opts = {
        signs = {
            add = {
                hl = 'GitSignsAdd',
                text = '+',
                numhl = 'GitSignsAddNr',
                linehl = 'GitSignsAddLn',
            },
            change = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
            delete = {
                hl = 'GitSignsDelete',
                text = '-',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            topdelete = {
                hl = 'GitSignsDelete',
                text = '-',
                numhl = 'GitSignsDeleteNr',
                linehl = 'GitSignsDeleteLn',
            },
            changedelete = {
                hl = 'GitSignsChange',
                text = '~',
                numhl = 'GitSignsChangeNr',
                linehl = 'GitSignsChangeLn',
            },
        },
        signcolumn = true, -- Toggle with `:GitSigns toggle_sings`
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        preview_config = {
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1,
        },
    },
    config = function(_, opts)
        local gitsigns = require('gitsigns')
        gitsigns.setup(opts)
        -- scrollbar integration
        require('scrollbar.handlers.gitsigns').setup()
    end,
}
}