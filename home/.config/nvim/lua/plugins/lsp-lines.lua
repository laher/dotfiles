return {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    config = function()
        local lsp_lines = require('lsp_lines')
        lsp_lines.setup()
        vim.keymap.set('', '<leader>l', lsp_lines.toggle, { desc = 'Toggle lsp_lines' })
        vim.diagnostic.config({
            virtual_text = false
        })
    end,
}
