return {
  {
    'nvim-treesitter/nvim-treesitter-context',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = {
        'BufReadPost',
        'BufNewFile',
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
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
        require("nvim-treesitter.install").compilers = { "gcc-13" } -- for neorg. upgrade occasionally!
    end,
  }
}
