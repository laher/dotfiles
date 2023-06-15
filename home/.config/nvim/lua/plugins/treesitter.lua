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
  },
  -- splitjoin
  {
    'Wansmer/treesj',
    keys = {
        '<leader>m',
        '<leader>j',
        '<leader>s',
    },
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {
        max_join_length = 150
    }
},

    -- hlargs.nvim - do we still need this in nvim-0.9?
    {
        'm-demare/hlargs.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        ft = {
            'c',
            'cpp',
            'cs',
            'go',
            'java',
            'js',
            'jsx',
            'ts',
            'tsx',
            'jl',
            'lua',
            'nix',
            'php',
            'py',
            'r',
            'R',
            'rb',
            'vim',
            'zig',
            'rs'
        },
        config = true
    },

}
