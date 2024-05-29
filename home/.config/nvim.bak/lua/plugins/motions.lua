return {
    -- leap.nvim
    {
        'ggandor/leap.nvim',
        dependencies = 'tpope/vim-repeat',
        keys = {
            { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
            { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
            { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
        },
        config = function(_, opts)
            local leap = require('leap')
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ 'x', 'o' }, 'x')
            vim.keymap.del({ 'x', 'o' }, 'X')
        end
    },

    -- flit.nvim
    {
        'ggandor/flit.nvim',
        dependencies = 'ggandor/leap.nvim',
        keys = function()
            local ret = {}
            for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
                ret[#ret+1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
            end
            return ret
        end,
        opts = { labeled_modes = 'nx' }
    },

    -- extends % to html tags etc
{
    'andymass/vim-matchup',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = {
        'BufReadPost',
        'BufNewFile',
    },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
    end,
},
}
