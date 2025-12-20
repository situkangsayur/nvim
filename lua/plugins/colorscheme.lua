return {
  'tomasiser/vim-code-dark',
  'xolox/vim-misc',
  {
    'xolox/vim-colorscheme-switcher',
    dependencies = { 'xolox/vim-misc' },
    config = function()
      vim.g.colorscheme_switcher_define_mappings = 0
      vim.keymap.set('n', '<F8>', ':NextColorScheme<CR>')
      vim.keymap.set('n', '<F7>', ':PrevColorScheme<CR>')
      vim.g.colorscheme_switcher_keep_background = 1
    end
  },
  'rafi/awesome-vim-colorschemes',
  'junegunn/seoul256.vim',
  'romgrk/doom-one.vim'
}
