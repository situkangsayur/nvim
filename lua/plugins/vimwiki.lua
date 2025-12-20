return {
  'vimwiki/vimwiki',
  config = function()
    vim.g.vimwiki_list = {{ path = '~/workspace/wiki', syntax = 'markdown', ext = '.md' }}
  end
}
