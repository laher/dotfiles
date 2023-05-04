return {
    'RRethy/vim-illuminate',
    event = 'LspAttach',
    opts = {
        filetypes_denylist = {
            'alpha',
            'NvimTree',
            'help',
            'text',
        },
    },
    config = function(_, opts)
        require('illuminate').configure(opts)
    end
}
