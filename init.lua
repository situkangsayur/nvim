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

-- Matikan provider yang tidak dipakai (coc punya jembatan node sendiri; perl/ruby
-- tidak dipakai). Menghilangkan warning di :checkhealth tanpa efek samping.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- setup plugins
require("lazy").setup({
  spec = {
    -- import all files from lua/plugins
    { import = "plugins" },
  },
  -- Matikan luarocks. Satu-satunya plugin yang punya rockspec di sini adalah
  -- image.nvim, dan kita sudah pakai `processor = 'magick_cli'` (ImageMagick CLI)
  -- sehingga rock `magick` tidak diperlukan. Kalau dibiarkan, lazy menarik
  -- hererocks untuk membangun Lua 5.1, gagal di mesin tanpa toolchain luarocks,
  -- lalu mengulang tiap startup sampai error "Too many rounds of missing plugins"
  -- dan sebagian plugin batal dimuat.
  rocks = { enabled = false, hererocks = false },
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
--
-- Tree-aware split: when the cursor sits inside the nvim-tree window, a plain
-- :split/:vsplit would split the *tree* itself. Instead, open the file under
-- the cursor in a split in the editor area (right of the tree) and leave the
-- tree completely alone. Anywhere else this behaves like a normal split of the
-- current buffer at the current cursor position.
_G.SmartSplit = function(direction)
  local split_cmd = direction == 'vertical' and 'vsplit' or 'split'

  if vim.bo.filetype == 'NvimTree' then
    local api = require('nvim-tree.api')
    local node = api.tree.get_node_under_cursor()
    -- Only act on real files; directories/links keep their tree behavior.
    if not (node and node.type == 'file') then
      return
    end

    -- Don't use api.node.open.* here: with 2+ editor windows open it triggers
    -- nvim-tree's window picker (the "pick a window" prompt). Instead we pick a
    -- real editor window ourselves and split it deterministically — first
    -- non-tree, non-floating window in the tab.
    local target
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      local buf = vim.api.nvim_win_get_buf(win)
      local floating = vim.api.nvim_win_get_config(win).relative ~= ''
      if vim.bo[buf].filetype ~= 'NvimTree' and not floating then
        target = win
        break
      end
    end
    if target then
      vim.api.nvim_set_current_win(target)
    end
    vim.cmd(split_cmd .. ' ' .. vim.fn.fnameescape(node.absolute_path))
    return
  end

  vim.cmd(split_cmd)
end

map('n', '<Leader>-', function() _G.SmartSplit('horizontal') end, { silent = true, desc = 'Split horizontal (tree-aware)' })
map('n', '<Leader>\\', function() _G.SmartSplit('vertical') end, { silent = true, desc = 'Split vertical (tree-aware)' })
map('n', '<Leader>=', '<C-w>=', { silent = true, desc = 'Equalize split sizes' })

-- split + open new file via FZF picker (replaces <C-w>s / <C-w>v which kitty
-- intercepts as close-tab). mnemonic: w = window, s/v = horizontal/vertical
--
-- Like the split maps above these are tree-aware: if invoked from the tree we
-- first hop to the editor window so the new split (and the FZF-picked file)
-- lands in the editor area instead of carving up the tree.
_G.SmartSplitPick = function(direction)
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd l')
  end
  vim.cmd(direction == 'vertical' and 'vsplit' or 'split')
  vim.cmd('FZFSmart')
end

map('n', '<Leader>ws', function() _G.SmartSplitPick('horizontal') end, { silent = true, desc = 'Split horizontal + pick file' })
map('n', '<Leader>wv', function() _G.SmartSplitPick('vertical') end, { silent = true, desc = 'Split vertical + pick file' })

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

-- ── Auto-reload buffer yang diubah dari luar (Claude Code / Gemini CLI nulis file) ──
-- Tanpa ini, file yang ditulis AI baru kelihatan setelah :e manual. autoread +
-- checktime berkala bikin perubahan muncul "live" di buffer yang sedang dibuka.
vim.opt.autoread = true
local reload_grp = vim.api.nvim_create_augroup('ai_autoreload', { clear = true })
vim.api.nvim_create_autocmd(
  { 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI', 'TermLeave' },
  {
    group = reload_grp,
    callback = function()
      if vim.fn.mode() ~= 'c' and vim.fn.getcmdwintype() == '' then
        vim.cmd('silent! checktime')
      end
    end,
  }
)
-- timer: cek perubahan tiap 1.5s walau cursor diam (AI nulis saat kamu ngetik)
local reload_timer = vim.loop.new_timer()
reload_timer:start(1500, 1500, vim.schedule_wrap(function()
  if vim.fn.mode() ~= 'c' and vim.fn.getcmdwintype() == '' then
    vim.cmd('silent! checktime')
  end
end))
-- notifikasi kecil saat file di-reload
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = reload_grp,
  callback = function()
    vim.notify('Buffer di-reload (diubah di disk)', vim.log.levels.INFO)
  end,
})

-- ── AI switcher: Claude & Gemini berbagi satu panel kanan (gantian) ──────────
-- Keduanya panel kanan lebar 0.4. Buka salah satu -> yang lain ditutup, jadi
-- tidak menumpuk / makan tempat. Izin/confirm & eksekusi command tetap diurus
-- CLI masing-masing di dalam terminalnya.
local function gemini_visible()
  for _, w in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(w)].filetype == 'terminalGemini' then
      return true
    end
  end
  return false
end
_G.AIShow = function(which)
  if which == 'claude' then
    pcall(vim.cmd, 'GeminiClose')
    vim.cmd('ClaudeCodeOpen')
  elseif which == 'gemini' then
    pcall(vim.cmd, 'ClaudeCodeClose')
    -- GeminiToggle = buka kalau tertutup, tapi juga tutup kalau sudah terbuka.
    -- Jadi hanya toggle saat belum terlihat supaya selalu "show", tak menutup.
    if not gemini_visible() then pcall(vim.cmd, 'GeminiToggle') end
  end
end
_G.AIHide = function()
  pcall(vim.cmd, 'ClaudeCodeClose')
  pcall(vim.cmd, 'GeminiClose')
end

map('n', '<Leader>ac', function() _G.AIShow('claude') end, { desc = 'AI: Claude (tutup Gemini)' })
map('n', '<Leader>ag', function() _G.AIShow('gemini') end, { desc = 'AI: Gemini (tutup Claude)' })
map('n', '<Leader>ax', function() _G.AIHide() end,         { desc = 'AI: tutup panel' })
map('n', '<Leader>aa', function()
  vim.ui.select({ 'Claude', 'Gemini' }, { prompt = 'AI panel:' }, function(choice)
    if choice == 'Claude' then _G.AIShow('claude')
    elseif choice == 'Gemini' then _G.AIShow('gemini') end
  end)
end, { desc = 'AI: pilih panel' })
