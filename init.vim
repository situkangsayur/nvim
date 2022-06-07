" Plugins will be downloaded under the specified directory.
"
let g:EditorConfig_exec_path = '.editorconfig'
let g:EditorConfig_core_mode = 'external_command'

nmap <F1> :CocCommand java.debug.vimspector.start<CR>
" this is important for dev icons to work
set encoding=UTF-8



source /Users/hendrikarisma/.config/nvim/plug-config/plugins.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/s1n7ax.vim

source /Users/hendrikarisma/.config/nvim/plug-config/barbar.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/coc.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/tagbar.vim 

source /Users/hendrikarisma/.config/nvim/plug-config/vimspector.vim

" lua require'nvim-treesitter.configs'.setup { ensure_installed = "maintained", highlight = { enable = true, }, }

set nornu

source /Users/hendrikarisma/.config/nvim/plug-config/php.vim
