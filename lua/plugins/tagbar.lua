return {
  'preservim/tagbar',
  config = function()
    vim.keymap.set('n', '<leader>po', ':TagbarToggle<CR>')
    vim.g.Tlist_Ctags_Cmd = '/usr/bin/ctags'
    vim.opt.tags = './tags,tags;' .. vim.fn.expand('$HOME')
  end
}
