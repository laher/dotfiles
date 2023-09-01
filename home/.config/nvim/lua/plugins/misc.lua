return {

  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    event = {
      'BufReadPost',
      'BufNewFile'
    },
    config = true
  },

  -- bufdelete.nvim
  -- delete buffer without creating/updating windows
  {
    'famiu/bufdelete.nvim',
    cmd = 'Bdelete'
  },

  -- nvim-hlslens
  -- highlights search matches with numbers;
  {
    'kevinhwang91/nvim-hlslens',
    keys = {
      'n',
      'N',
      '*',
      '#'
    },
    dependencies = 'romainl/vim-cool',
    config = true
  },

  -- peek buffer while entering command
  {
    'nacro90/numb.nvim',
    event = 'CmdlineEnter',
    config = true
  },

  -- toggle between relative and absolute line numbers
  {
    'cpea2506/relative-toggle.nvim',
    event = 'InsertEnter',
    config = true
  },

  -- collect problems in minubuffer
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'LspAttach',
    config = true
  },

  -- better-escape.nvim
  -- use jj/kk/etc to escape without lag
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = true
  },


  -- lastplace
  -- reopen files at last place
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require'nvim-lastplace'.setup{}
    end,
  },

  -- browser textarea
  {
    'glacambre/firenvim',

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load({ plugins = {"firenvim"}, wait = true })
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.g.firenvim_config = {
          globalSettings = { alt = "all" },
          localSettings = {
              [".*"] = {
                  selector = "textarea",
                  takeover = "never"
              },
          }
      }
    end,
  },

  -- gx - open links
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    -- you can specify also another config if you want
    config = function() require("gx").setup {
      open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        search = true, -- search the web/selection on the web if nothing else is found
      },
      handler_options = {
        search_engine = "google", -- you can select between google, bing and duckduckgo
      },
    } end,
  },
}
