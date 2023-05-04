return {
    'andymass/vim-matchup',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    event = {
        'BufReadPost',
        'BufNewFile',
    },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
    end,
}
