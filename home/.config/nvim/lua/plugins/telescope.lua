return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
        'nvim-telescope/telescope-file-browser.nvim',
        'debugloop/telescope-undo.nvim'
    },
    branch = '0.1.x',
    cmd = 'Telescope',
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
        -- Load the extensions
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('file_browser')
        require('telescope').load_extension('undo')
    end,
}
