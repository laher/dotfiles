return {
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
