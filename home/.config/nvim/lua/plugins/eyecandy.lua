return {
  -- fancier dropdowns and stuff
  {
    'stevearc/dressing.nvim',
    lazy = true,
    init = function()
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end
  },
  {
    'folke/zen-mode.nvim',
    cmd = 'ZenMode',
    opts = {
      plugins = {
        kitty = {
          enabled = true,
          font = '+4'
        },
        twilight = { enabled = false }
      }
    }
  },
  -- fancy folds
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = {
      'BufReadPost',
      'BufNewFile'
    },
    opts = {
      provider_selector = function(_, filetype, buftype)
        local function handleFallbackException(bufnr, err, providerName)
          if type(err) == 'string' and err:match('UfoFallbackException') then
            return require('ufo').getFolds(bufnr, providerName)
          else
            return require('promise').reject(err)
          end
        end
        return (filetype == '' or buftype == 'nofile') and 'indent'
        or function(bufnr)
          return require('ufo')
          .getFolds(bufnr, 'lsp')
          :catch(function(err)
            return handleFallbackException(bufnr, err, 'treesitter')
          end)
          :catch(function(err)
            return handleFallbackException(bufnr, err, 'indent')
          end)
        end
      end,
    },
  },
  -- fancy scrollbars
  {
    'petertriho/nvim-scrollbar',
    event = {
      'BufReadPost',
      'BufNewFile'
    },
    config = function()
      local scrollbar = require('scrollbar')
      local colors = require('tokyonight.colors').setup()
      scrollbar.setup({
        handle = {
          color = colors.bg_highlight,
        },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },
  -- highlight uses of word-under-cursor
  {
    'RRethy/vim-illuminate',
    event = 'LspAttach',
    opts = {
      filetypes_denylist = {
        'alpha',
        'NvimTree',
        'help',
        'text',
      },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)
    end
  },
  -- 'browser tabs'
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    version = '*',
    event = 'UIEnter',
    cond = not vim.g.started_by_firenvim,
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' '
            or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
      },
    },
  },
  -- code context
  {
    'SmiteshP/nvim-navic',
    event = 'LspAttach',
    opts = {
      icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
      },
    },
  },
  {
    "giusgad/pets.nvim",
    cmd = {'PetsList','PetsNew'},
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
  },

  -- colorful-winsep.nvim
  {
    'nvim-zh/colorful-winsep.nvim',
    event = 'WinNew',
    config = true
  },

  -- makes current window bigger
  -- {
    --   'anuvyklack/windows.nvim',
    --   dependencies = {
      --     'anuvyklack/middleclass',
      --     'anuvyklack/animation.nvim',
      --   },
      --   event = 'WinNew',
      --   config = function()
        --     vim.o.winwidth = 10
        --     vim.o.winminwidth = 10
        --     vim.o.equalalways = false
        --     require('windows').setup()
        --   end,
        -- },

        -- nvim-notify
        {
          'rcarriga/nvim-notify',
          event = {
            'BufReadPost',
            'BufNewFile'
          },
          opts = {
            background_colour = '#000000',
          },
          config = function(_, opts)
            local notify = require('notify')
            notify.setup(opts)
            vim.notify = notify
          end,
        },

        -- nvim-lsp-notify
        -- {
          --     'mrded/nvim-lsp-notify',
          --     event = 'LspAttach',
          --     opts = {
            --         icons = {
              --             spinner = { '┤', '┘', '┴', '└', '├', '┌', '┬', '┐' },
              --             done = false
              --         },
              --     },
              -- },
            }
