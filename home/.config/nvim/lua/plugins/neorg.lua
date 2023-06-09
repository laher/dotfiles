return {
  {
    dir = "~/dl/neorg",
    -- "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    keys = {
      { '<localleader>x', ':Neorg exec cursor<CR>', desc = 'Exec code block under curos' },
      { '<localleader>X', ':Neorg exec current-file<CR>', desc = 'Exec all blocks in this buffer' },
      { '<leader>o', ':Neorg index<CR>', desc = 'Launch neorg index' },
      -- { '<c-a>', ":'<,'>GitCapture<CR>", desc = 'GitCapture', mode = { 'v' } },
      -- { '<c-a>', ":lua require'gitlinker'.get_buf_range_url('v', {action_callback = vim.notify})<cr>", mode = 'v' }, --, { action_callback = function(url) vim.cmd('Neorg', 'capture', 'popup-with', url) end })<cr>", mode = {"v"}}
    },

    -- vim.api.nvim_create_user_command("GitCapture", function(opts)
    --       vim.notify(vim.inspect(opts))
    --       require'gitlinker'.get_buf_range_url('v',
    --       { action_callback = module.public.show_capture_popup_with_url })
    ft = "norg",
    cmd = {"Neorg", "PlenaryBustedDirectory", "GitCapture"},
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.qol.todo_items"] = {
          config = {
            --    order = { "undone", "done", "pending" },
          },
        },
        ["core.summary"] = {},
        ["core.journal"] = {
          config = {
          },
        },
        ["core.concealer"] = {
          config = {
            folds = true,
            icon_preset = "diamond",
            icons = {
              todo = {
                cancelled = { icon = "" },
                done = { icon = "" },
                on_hold = { icon = "󰩏" },
                undone = { icon = "⭘" },
                pending = { icon = "" },
                recurring = { icon = "󰑧" },
                uncertain = { icon = "?" },
                urgent = { icon = "󰑮" },
              },
              heading = {
                level_1 = { icon = "❖" },
                level_2 = { icon = "◈" },
                level_3 = { icon = "⟡" },
                level_4 = { icon = "◇" },
                level_5 = { icon = "◆" },
                level_6 = { icon = "⋄" },
              }
            },
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            work = "~/notes/work",
            home = "~/notes/home",
          },
          default_workspace = "work",
          -- open_last_workspace = true
        },
      },
     -- ["core.ui.calendar"] = {},
      ["external.templates"] = {},
      ["external.exec"] = {
        config = {
          default_metadata = {
            enabled = true,
            env = {
              NEORG = nil
            },
          },
          lang_cmds = {
            lua = {
              cmd = "luajit ${0}",
              type = "interpreted",
              repl = nil,
            }
          },
        }
      },
      ["external.codecap"] = {},
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } }, -- ADD THIS LINE
    { dir = "~/dl/neorg-exec" },
    { dir = "~/dl/neorg-codecap",
      keys = {
        { '<leader>cce', desc = 'capture a thing. open with :edit',  mode = { 'v', 'n' } },
        { '<leader>ccv', desc = 'capture a thing. open inbox with :vsplit',  mode = { 'v', 'n' } },
        { '<leader>ccs', desc = 'capture a thing. open inbox with :split',  mode = { 'v', 'n' } },
        { '<leader>ccn', desc = 'capture a thing. do not open inbox',  mode = { 'v', 'n' } },
        { '<leader>cci', desc = 'open inbox',  mode = { 'n' } },
        { '<leader>ccd', desc = 'capture a diff. open inbox with :edit',  mode = { 'n' } },
      },
      config = function()
        require'codecap'.setup({})
      end},
  },
},
}
