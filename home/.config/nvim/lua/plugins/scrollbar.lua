return {
    'petertriho/nvim-scrollbar',
    event = {
        'BufReadPost',
        'BufNewFile'
    },
    config = function()
        local scrollbar = require('scrollbar')
        local colors = require('tokyonight.colors').setup()
        scrollbar.setup({
            handle = {
                color = colors.bg_highlight,
            },
            marks = {
                Search = { color = colors.orange },
                Error = { color = colors.error },
                Warn = { color = colors.warning },
                Info = { color = colors.info },
                Hint = { color = colors.hint },
                Misc = { color = colors.purple },
            },
        })
    end,
}
