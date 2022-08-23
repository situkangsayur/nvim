" Plugins will be downloaded under the specified directory.
"
" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
call plug#begin('~/.vim/plugged')
Plug 'roxma/nvim-yarp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"------------------------------------------------------------------------------"
"                                vim javascript                                "
"------------------------------------------------------------------------------"
Plug 'pangloss/vim-javascript'
"------------------------------------------------------------------------------"
"                                    vim tsx                                   "
"------------------------------------------------------------------------------"
Plug 'ianks/vim-tsx'
"------------------------------------------------------------------------------"
"                                typescript vim                                "
"------------------------------------------------------------------------------"
Plug 'leafgarland/typescript-vim'
"------------------------------------------------------------------------------"
"                                      fzf                                     "
"------------------------------------------------------------------------------"
" need to install the silver search in ubuntu : silversearcher-ag
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"------------------------------------------------------------------------------"
"                             vim multiple cursors                             "
"------------------------------------------------------------------------------"
Plug 'terryma/vim-multiple-cursors'
"------------------------------------------------------------------------------"
"                                      fzf                                     "
"------------------------------------------------------------------------------"
" ignore files and folders in git ignore
"------------------------------------------------------------------------------"
"                                 vim surround                                 "
"------------------------------------------------------------------------------"
Plug 'tpope/vim-surround'
"------------------------------------------------------------------------------"
"                             vim multiple cursors                             "
"------------------------------------------------------------------------------"
Plug 'terryma/vim-multiple-cursors'

"------------------------------------------------------------------------------"
"                                   emmet vim                                  "
"------------------------------------------------------------------------------"
Plug 'mattn/emmet-vim'

"------------------------------------------------------------------------------"
"                                 vim gitgutter                                "
"------------------------------------------------------------------------------"
" vim gitgutter blocks the coc-nvim languale server validations in the editor
" Plug 'airblade/vim-gitgutter'


"------------------------------------------------------------------------------"
"                                  delimitMate                                 "
"------------------------------------------------------------------------------"
Plug 'Raimondi/delimitMate'

"------------------------------------------------------------------------------"
"                                nerd commenter                                "
"------------------------------------------------------------------------------"
Plug 'scrooloose/nerdcommenter'

"------------------------------------------------------------------------------"
"                                 comment frame                                "
"------------------------------------------------------------------------------"
Plug 'cometsong/CommentFrame.vim'

"------------------------------------------------------------------------------"
"                                   nerd tree                                  "
"------------------------------------------------------------------------------"
Plug 'scrooloose/nerdtree'
"------------------------------------------------------------------------------"
"                                   vim viki                                   "
"------------------------------------------------------------------------------"
Plug 'vimwiki/vimwiki'
"------------------------------------------------------------------------------"
"                                   auto save                                  "
"------------------------------------------------------------------------------"
Plug '907th/vim-auto-save'
"------------------------------------------------------------------------------"
"                                    scalpel                                   "
"------------------------------------------------------------------------------"
Plug 'wincent/scalpel'


"------------------------------------------------------------------------------"
"                                  auto pairs                                  "
"------------------------------------------------------------------------------"
Plug 'jiangmiao/auto-pairs'


"------------------------------------------------------------------------------"
"                                 vim startify                                 "
"------------------------------------------------------------------------------"
" Plug 'mhinz/vim-startify'


"------------------------------------------------------------------------------"
"                                 smooth scroll                                "
"------------------------------------------------------------------------------"
Plug 'psliwka/vim-smoothie'



"------------------------------------------------------------------------------"
"                                  quick scope                                 "
"------------------------------------------------------------------------------"
Plug 'unblevable/quick-scope'


"------------------------------------------------------------------------------"
"                                    themes                                    "
"------------------------------------------------------------------------------"
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tomasiser/vim-code-dark'

"------------------------------------------------------------------------------"
"                                  vim ariline                                 "
"------------------------------------------------------------------------------"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Declare the list of plugins.
Plug 'junegunn/seoul256.vim'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" luafile config/coc-extensions.lua
" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'mfussenegger/nvim-dap'

" plugin for font replaced before
" Plug 'ryanoasis/vim-devicons'
" List ends here. Plugins become visible to Vim after this call.
"------------------------------------------------------------------------------"
"                                   dev icons                                  "
"------------------------------------------------------------------------------"
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'romgrk/doom-one.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-signify'

"------------------------------------------------------------------------------"
"                                   php specific plugin                                  "
"------------------------------------------------------------------------------"
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'jwalton512/vim-blade'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}

" to add tagbar togle
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'davidhalter/jedi-vim'
Plug 'puremourning/vimspector'

" kotlin
Plug 'udalov/kotlin-vim'
Plug 'fatih/vim-go'
call plug#end()

let g:EditorConfig_exec_path = '.editorconfig'
let g:EditorConfig_core_mode = 'external_command'

nmap <F1> :CocCommand java.debug.vimspector.start<CR>
" this is important for dev icons to work
set encoding=UTF-8


" lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true, }, }

" source /home/hendri/.config/nvim/plug-config/plugins.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/s1n7ax.vim

source /Users/hendrikarisma/.config/nvim/plug-config/barbar.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/coc.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/tagbar.vim 

source /home/hendrikarisma/.config/nvim/plug-config/vimspector.vim

" lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true, }, }

set nornu

source /Users/hendrikarisma/.config/nvim/plug-config/php.vim
