return {
  'scrooloose/nerdtree',
  config = function()
    vim.g.NERDTreeMapOpenInTab = '<Leader>ntt'
    vim.keymap.set('n', '<Leader>nt', ':NERDTree<CR>')
    vim.keymap.set('n', '<Leader>ntf', ':NERDTreeFocus<CR>')
    vim.keymap.set('n', '<Leader>1', ':NERDTreeFocus<CR>')
    vim.keymap.set('n', '<Leader>ntr', ':NERDTreeRefreshRoot<CR>')

    vim.api.nvim_create_autocmd("StdinReadPre", {
      callback = function() vim.g.s_std_in = 1 end
    })
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 and not vim.g.s_std_in then
          vim.cmd('NERDTree')
        end
      end
    })
  end
}
