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

    -- numb.nvim
    -- peek buffer while entering command
    {
        'nacro90/numb.nvim',
        event = 'CmdlineEnter',
        config = true
    },

    -- relative-toggle.nvim
    -- toggle between relative and absolute line numbers
    {
        'cpea2506/relative-toggle.nvim',
        event = 'InsertEnter',
        config = true
    },

    -- trouble.nvim
    {
        'folke/trouble.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'LspAttach',
        config = true
    },

    -- better-escape.nvim
    {
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        config = true
    },


    -- lastplace
    {
      'ethanholz/nvim-lastplace',
      config = function()
        require'nvim-lastplace'.setup{}
      end,
    },
}
