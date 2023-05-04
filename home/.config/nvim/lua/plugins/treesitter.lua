return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {
        'BufReadPost',
        'BufNewFile'
    },
    opts = {
        ensure_installed = {
            'lua',
            'luadoc',
            'luap',
            'cpp',
            'markdown',
            'markdown_inline',
            'git_config',
            'git_rebase',
            'gitcommit',
            'gitignore',
            'gitattributes',
            'comment',
            'diff',
            'vim',
            'vimdoc'
        },
        ignore_install = { '' },
        auto_install = true,
        matchup = {
            enabled = true
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
