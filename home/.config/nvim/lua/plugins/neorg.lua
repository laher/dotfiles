return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
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
            -- toc_format = function(entries)
            --   local months_text = {
            --     "January",
            --     "February",
            --     "March",
            --     "April",
            --     "May",
            --     "June",
            --     "July",
            --     "August",
            --     "September",
            --     "October",
            --     "November",
            --     "December",
            --   }
            --   -- Convert the entries into a certain format to be written
            --   local output = {}
            --   local current_year
            --   local current_month
            --   for _, entry in ipairs(entries) do
            --     -- Don't print the year and month if they haven't changed
            --     if not current_year or current_year < entry[1] then
            --       current_year = entry[1]
            --       table.insert(output, "* " .. current_year)
            --     end
            --     if not current_month or current_month < entry[2] then
            --       current_month = entry[2]
            --       table.insert(output, "** " .. months_text[current_month])
            --     end
            --
            --     -- Prints the file link
            --     print(vim.inspect(entry))
            --     table.insert(output, entry[4] .. string.format("[%s]", entry[5]))
            --   end
            --
            --   return output
            -- end,
          },
        },
        ["core.concealer"] = {
          config = {
            folds = false,
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

          -- search file
    -- local neorg_callbacks = require("neorg.callbacks")
    -- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    --     -- Map all the below keybinds only when the "norg" mode is active
    --     keybinds.map_event_to_mode("norg", {
    --         n = { -- Bind keys in normal mode
    --             { "<C-c>", "external.exec.view" },
    --         },
    --     }, {
    --         silent = true,
    --         noremap = true,
    --     })
    -- end)
        }
      },
    },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } }, -- ADD THIS LINE
    { dir = "~/dl/neorg-exec" },
  },
  -- config = function()
    -- local neorg_callbacks = require("neorg.callbacks")
    -- neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    --     -- Map all the below keybinds only when the "norg" mode is active
    --     keybinds.map_event_to_mode("norg", {
    --         n = { -- Bind keys in normal mode
    --             { "<C-c>", "external.exec.view" },
    --         },
    --     }, {
    --         silent = true,
    --         noremap = true,
    --     })
    -- end)
  -- end,
},
}
