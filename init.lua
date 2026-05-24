-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ','

-- setup plugins
require("lazy").setup({
  spec = {
    -- import all files from lua/plugins
    { import = "plugins" },
  }
})

-- basic settings
vim.opt.encoding = "utf-8"
vim.opt.shell = "/bin/sh"

vim.opt.number = true
vim.opt.relativenumber = true

-- Cursor settings (for terminal)
vim.cmd([[
  let &t_SI = "\e[6 q"
  let &t_SR = "\e[4 q"
  let &t_EI = "\e[2 q"
]])

-- Code folding
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false

vim.opt.spelllang = "en"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.formatoptions:remove("ro")

vim.opt.mouse = "a"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 10

vim.opt.clipboard = "unnamedplus"

vim.opt.termguicolors = true -- assuming colorscheme sonokai is a true color scheme
vim.cmd('set t_Co=256')
vim.opt.hlsearch = false -- nohlsearch
vim.cmd('syntax on')

vim.opt.fillchars = "vert:│" -- set fillchars+=vert:\|

-- allow windows to be closed while keeping the buffer
vim.opt.hidden = true

-- set colorscheme
vim.cmd('colorscheme sonokai')
vim.cmd('set background=dark')

-- Helper function SubstituteMotion
_G.SubstituteMotion = function(type, ...)
  local reg = vim.g.substitutemtion_reg
  local count = select('#', ...)
  local start_mark = '`<`'
  local end_mark = '`>`'

  local normal_cmd = "normal! "

  if count > 0 then
    -- This part is for when called with a motion, like cpw
    vim.cmd(normal_cmd .. start_mark .. type .. end_mark .. "\"_c<C-r>" .. reg .. "<Esc>")
  elseif type == 'line' then
    vim.cmd(normal_cmd .. "'[V']\"_c<C-r>" .. reg .. "<Esc>")
  elseif type == 'block' then
    vim.cmd(normal_cmd .. "'[\\<C-V>`]'\"_c<C-r>" .. reg .. "<Esc>")
  else
    -- Assuming 'char' type
    vim.cmd(normal_cmd .. "'[v`]'\"_c<C-r>" .. reg .. "<Esc>")
  end
end

-- Keybinds
local map = vim.keymap.set

-- go normal mode
map('i', 'jk', '<Esc>', { silent = true })

-- save
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>a')

-- quit
map('n', '<C-q>', ':q<CR>')
map('i', '<C-q>', '<Esc>:q<CR>')

-- move line up and down
map('n', '<S-Up>', ':m-2<CR>')
map('n', '<S-Down>', ':m+<CR>')
map('i', '<S-Up>', '<Esc>:m-2<CR>')
map('i', '<S-Down>', '<Esc>:m+<CR>')

-- move between split views
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- create / manage splits  (mnemonic: - horizontal line, \ vertical bar)
map('n', '<Leader>-', ':split<CR>', { silent = true, desc = 'Split horizontal' })
map('n', '<Leader>\\', ':vsplit<CR>', { silent = true, desc = 'Split vertical' })
map('n', '<Leader>=', '<C-w>=', { silent = true, desc = 'Equalize split sizes' })

-- spell check
map('n', '<F6>', ':setlocal spell! spelllang=en_us<CR>')

-- select function
map('n', '<Leader>vf', 'va{V')

-- switch to normal mode in terminal
map('t', '<Esc>', '<C-\\><C-n>')
map('t', 'jk', '<C-\\><C-n>')

-- open vimrc
map('n', '<space>e', ':vsp $MYVIMRC<cr>')

-- reload the .vimrc
map('n', '<space>r', ':so $MYVIMRC<cr>')

-- open terminal
map('n', '<Leader>tv', ':vsp<CR>:terminal<CR>i')
map('n', '<Leader>th', ':sp<CR>10<C-w>_:terminal<CR>i')

-- remove & change the word under the cursor
map('n', 'c*', '*Ncgn')
map('n', 'd*', '*Ndgn')

-- replace yanked word
map('n', 'cp', ':let g:substitutemtion_reg = v:register <bar> set opfunc=_G.SubstituteMotion<CR>g@')
