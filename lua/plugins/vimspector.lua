return {
  'puremourning/vimspector',
  config = function()
    vim.g.vimspector_enable_mappings = 'HUMAN'
    vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-go', 'CodeLLDB', 'vscode-node-debug2' }

    local map = vim.keymap.set
    map('n', '<leader>vl', ':call vimspector#Launch()<CR>')
    map('n', '<leader>vr', ':VimspectorReset<CR>')
    map('n', '<leader>ve', ':VimspectorEval')
    map('n', '<leader>vw', ':VimspectorWatch')
    map('n', '<leader>vo', ':VimspectorShowOutput')
    map('x', '<leader>vi', '<Plug>VimspectorBalloonEval')
    map('n', '<leader>vc', ':call vimspector#ClearBreakpoints()<CR>')
    map('n', '<F1>', ':CocCommand java.debug.vimspector.start<CR>')
  end
}
