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
        'kdheepak/lazygit.nvim',
    },
    branch = '0.1.x',
    cmd = 'Telescope',
    keys = {
      '<leader>ff',
      '<leader>fg',
      '<leader>gg',
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
        local t= require('telescope')
        t.setup {}
        t.load_extension('fzf')
        t.load_extension('file_browser')
        t.load_extension('undo')
        t.load_extension('dap')
        t.load_extension('lazygit')

        local live_gitroot = function()
          require('telescope.builtin').live_grep({cwd = vim.fn.finddir('.git', vim.fn.getcwd() .. ";") .. '/..' })
        end
        vim.keymap.set('n', '<leader>fg', live_gitroot, { silent = true })
        vim.keymap.set('n', '<leader>ff', require('telescope.builtin').git_files, { silent = true })
        vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { silent = true })
        vim.api.nvim_create_autocmd('BufEnter', { callback = function()
            require('lazygit.utils').project_root_dir()
          end })
    end,
}
