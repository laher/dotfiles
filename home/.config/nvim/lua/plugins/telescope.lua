return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        'nvim-telescope/telescope-file-browser.nvim',
        'debugloop/telescope-undo.nvim',
        -- {
        --  'ahmedkhalf/project.nvim',
        --  event = "BufReadPost",
        --  cmd = "Project",
        --  config = function()
        --   require("project_nvim").setup({
        --       manual_mode = false,
        --       detection_methods = { "lsp", "pattern" },
        --       patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        --       ignore_lsp = { "null-ls", "copilot" },
        --       exclude_dirs = {},
        --       show_hidden = false,
        --       silent_chdir = true,
        --       scope_chdir = "global",
        --       datapath = vim.fn.stdpath("data"),
        --     })
        --  end
        -- },
        'nvim-telescope/telescope-dap.nvim',
    },
    branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
      '<leader>f',
      '<leader>g',
    },
    opts = {
        defaults = {
            path_display = { 'smart' },
            file_ignore_patterns = { '.git/' },
        },
        pickers = {
            find_files = {
                find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
            },
        },
        extensions = {
            fzf = {
                theme = 'tokyonight',
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            file_browser = {
                theme = 'tokyonight',
                hidden = true
            },
            undo = {
                side_by_side = true,
                layout_strategy = 'vertical',
                layout_config = {
                    preview_height = 0.8
                }
            }
        },
    },
    config = function()
        require('telescope').setup {}
        -- Load the extensions
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('undo')
        -- require('telescope').load_extension('projects')
        require('telescope').load_extension('dap')
        require('telescope').load_extension('dap')

        local live_gitroot = function()
          require('telescope.builtin').live_grep({cwd = vim.fn.finddir('.git', vim.fn.getcwd() .. ";") .. '/..' })
        end
        vim.keymap.set("n", "<leader>g", live_gitroot, { silent = true })
        vim.keymap.set("n", "<leader>f", require('telescope.builtin').git_files, { silent = true })
    end,
}
