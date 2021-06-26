" Plugins will be downloaded under the specified directory.
"
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter'
" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" luafile config/coc-extensions.lua
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mfussenegger/nvim-dap'
" Plug 'nvim-treesitter/nvim-treesitter'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true, }, }

