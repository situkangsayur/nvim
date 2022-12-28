let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>vl :call vimspector#Launch()<CR>
nmap <leader>vr :VimspectorReset<CR>
nmap <leader>ve :VimspectorEval
nmap <leader>vw :VimspectorWatch
nmap <leader>vo :VimspectorShowOutput
xmap <leader>vi <Plug>VimspectorBalloonEval
nmap <leader>vc :call vimspector#ClearBreakpoints()<CR>

nmap <F1> :CocCommand java.debug.vimspector.start<CR>
" for normal mode - the word under the cursor
" for visual mode, the visually selected text

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' ]
