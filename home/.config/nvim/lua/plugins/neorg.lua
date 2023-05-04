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
                  ["core.summary"] = {},
                  ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                        icons = {
                          todo = {
                            done = { icon = "✓" },
                            undone = { icon = "✗" },
                            pending = { icon = "✗" },
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
              },
        },
        dependencies = { { "nvim-lua/plenary.nvim" } },
    }
}
