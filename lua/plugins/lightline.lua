return {
  'itchyny/lightline.vim',
  config = function()
    vim.g.lightline = {
      colorscheme = 'wombat',
      active = {
        left = { { 'mode', 'paste' }, { 'readonly', 'filename', 'modified', 'method' } }
      },
      component_function = {
        method = 'NearestMethodOrFunction'
      },
    }
  end
}
