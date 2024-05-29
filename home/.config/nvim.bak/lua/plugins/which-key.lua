return {
    'folke/which-key.nvim',
    keys = {

        { '<leader>w', ':WhichKey<cr>', desc = 'Which Key' },
        "<leader>",
        '"',
        "'",
        "`",
    },
    config = function()
        local wk = require('which-key')
        local setup = {
            ignore_missing = true,
            hidden = {
                '<silent>',
                '<cmd>',
                '<Cmd>',
                '<CR>',
                'call',
                'lua',
                '^:',
                '^ ',
            },
        }

        local mappings = {
            ['d'] = 'Open dashboard',
            ['e'] = 'Explorer',
            ['l'] = 'Toggle lsp_lines',
            ['q'] = 'Quit the current file',
            ['Q'] = 'Quit neovim',
            ['w'] = 'Save the current file',
            ['m'] = 'Toggle the node under cursor (split if one line, join if multiline)',
            ['s'] = 'Split node under the cursor',
            ['j'] = 'Join node under the cursor',
            ['z'] = 'Toggle zen mode',
            ['u'] = 'Open undo tree',
            f = {
                name = 'Find',
                f = 'Files',
                w = 'Text',
                B = 'Buffers',
                h = 'Help pages',
                m = 'Man pages',
                r = 'Recent files',
                R = 'Registers',
                k = 'Keymaps',
                c = 'Commands',
                b = 'File browser'
            },
            i = {
                name = 'Illuminate',
                t = 'Toggle vim-illuminate globally',
                b = 'Toggle vim-illuminate per buffer',
            },
            b = {
                name = 'Buffer',
                k = 'Kill the current buffer',
                K = 'Kill the current buffer forcefully',
            },
            g = {
                name = 'Git',
                g = 'Open neogit',
                j = 'Next hunk',
                k = 'Prev hunk',
                l = 'Blame',
                p = 'Preview hunk',
                r = 'Reset hunk',
                R = 'Reset buffer',
                s = 'Stage hunk',
                S = 'Stage buffer',
                u = 'Undo stage hunk',
                o = 'Open changed file',
                b = 'Checkout branch',
                c = 'Checkout commit',
                d = 'Diff',
            },
            x = {
                name = 'Trouble',
                x = 'Toggle trouble',
                w = 'Toggle workspace diagnostics',
                d = 'Toggle document_diagnostics',
                q = 'Open up quickfix',
                l = 'Open up location list',
                r = 'Open up lsp references',
            },
            L = {
                name = 'Lazy.nvim',
                l = 'Open lazy.nvim',
                u = 'Update plugins',
                s = 'Sync plugins',
                L = 'Open the log',
                c = 'Clean plugins',
                p = 'Profiler'
            },
        }

        local opts = {
            mode = 'n',
            prefix = '<leader>',
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true,
        }

        wk.setup(setup)
        wk.register(mappings, opts)
    end,
}
