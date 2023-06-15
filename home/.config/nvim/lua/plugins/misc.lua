return {

    -- Comment.nvim
    {
        'numToStr/Comment.nvim',
        event = {
            'BufReadPost',
            'BufNewFile'
        },
        config = true
    },

    -- bufdelete.nvim
    -- delete buffer without creating/updating windows
    {
        'famiu/bufdelete.nvim',
        cmd = 'Bdelete'
    },

    -- nvim-hlslens
    -- highlights search matches with numbers;
    {
        'kevinhwang91/nvim-hlslens',
        keys = {
            'n',
            'N',
            '*',
            '#'
        },
        dependencies = 'romainl/vim-cool',
        config = true
    },

    -- peek buffer while entering command
    {
        'nacro90/numb.nvim',
        event = 'CmdlineEnter',
        config = true
    },

    -- toggle between relative and absolute line numbers
    {
        'cpea2506/relative-toggle.nvim',
        event = 'InsertEnter',
        config = true
    },

    -- collect problems in minubuffer
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'LspAttach',
        config = true
    },

    -- better-escape.nvim
    -- use jj/kk/etc to escape without lag
    {
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        config = true
    },


    -- lastplace
    -- reopen files at last place
    {
      'ethanholz/nvim-lastplace',
      config = function()
        require'nvim-lastplace'.setup{}
      end,
    },
}
