return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    keys = {
      { '<localleader>x', ':Neorg exec cursor<CR>', desc = 'Exec code block' },
      { '<leader>o', ':Neorg index<CR>', desc = 'Launch neorg' },
    },
    cmd = "Neorg",
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
      ["external.templates"] = {},
      ["external.exec"] = {
        config = {

        }
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } }, -- ADD THIS LINE
    { dir = "~/dl/neorg-exec" },
  },
},
}
