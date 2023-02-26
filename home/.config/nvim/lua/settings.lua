-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-- leftovers ...
vim.o.syntax = 'on'
vim.o.errorbells = false
vim.o.showmode = false
vim.o.backup = false
vim.o.undodir = vim.fn.stdpath('config') .. '/undodir'
vim.o.undofile = true
vim.o.incsearch = true
vim.o.autochdir = true

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = ','             -- change leader key
vim.opt.mouse = 'a'               -- enable mouse support
vim.opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
vim.opt.swapfile = false          -- don't use swapfile

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number = true             -- show line number
vim.opt.showmatch = true          -- highlight matching parenthesis
vim.opt.foldmethod = 'marker'     -- enable folding (default 'foldmarker')
vim.opt.colorcolumn = '160'        -- line lenght marker at 80 columns
vim.opt.splitright = true         -- vertical split to the right
vim.opt.splitbelow = true         -- orizontal split to the bottom
vim.opt.ignorecase = true         -- ignore case letters when search
vim.opt.smartcase = true          -- ignore lowercase for the whole pattern
vim.opt.linebreak = true          -- wrap on word boundary
vim.cmd('set whichwrap+=<,>,[,],h,l') -- right-arrow goes to next line

-- remove whitespace on save
-- vim.cmd [[au BufWritePre * :%s/\s\+$//e]]
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      vim.cmd('%s/\\s\\+$//e')
    end,
    desc = "remove whitespace on save",
})

-- highlight on yank
vim.api.nvim_exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden = true         -- enable background buffers
vim.opt.history = 100         -- remember n lines in history
vim.opt.lazyredraw = true     -- faster scrolling
vim.opt.synmaxcol = 240       -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
vim.opt.termguicolors = false      -- enable 24-bit RGB colors
if os.getenv('TERM') == 'kitty' then
    vim.opt.termguicolors = true      -- enable 24-bit RGB colors
end
    --[[ if $TERM =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
        set notermguicolors
    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
        set termguicolors
    elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
        if $XTERM_VERSION != ''
            set termguicolors
        elseif $KONSOLE_PROFILE_NAME != ''
            set termguicolors
        elseif $VTE_VERSION != ''
            set termguicolors
        else
            set notermguicolors
        endif
    elseif $TERM =~ ...
        ... and so forth ...
    endif ]]
if vim.g.vscode == nil then
 -- vim.cmd [[colorscheme gruvbox]]
 -- vim.opt.background = 'light'


  vim.cmd[[colorscheme tokyonight-day]]
end

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
vim.opt.expandtab = true      -- use spaces instead of tabs
vim.opt.shiftwidth = 2        -- shift n spaces when tab
vim.opt.tabstop = 2           -- 1 tab == n spaces
-- opt.shifttabstop = 2           -- 1 tab == n spaces
vim.opt.smartindent = true    -- autoindent new lines

-- don't auto commenting new lines
vim.cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
vim.cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

-- IndentLine
vim.g.indentLine_color_term = 239
-- g.indentLine_setColors = 0  -- set indentLine color
vim.g.indentLine_char = '┆'       -- set indentLine character

-- disable IndentLine for markdown files (avoid concealing)
vim.cmd [[autocmd FileType markdown let g:indentLine_enabled=0]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
vim.opt.completeopt = 'menuone,noselect,noinsert'


-----------------------------------------------------------
-- Window-scoped options
-----------------------------------------------------------
vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
vim.cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
vim.cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]


  require('kommentary.config').configure_language("xml", {
      multi_line_comment_strings = {"<!--", "-->"},
  })
