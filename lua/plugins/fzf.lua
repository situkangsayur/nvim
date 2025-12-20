return {
  {
    'junegunn/fzf',
    build = './install --all'
  },
  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    config = function()
      local map = vim.keymap.set
      vim.api.nvim_create_user_command('FZFGitIgnore', "call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))", {})
      map('n', '<C-p>', ':FZFGitIgnore <CR>')
      map('i', '<C-i>', '<Esc>:FZFGitIgnore <CR>')
      map('n', '<C-B>', ':Buffers <CR>')
      map('n', '<C-L>', ':Lines <CR>')
      map('n', '<Leader>fzl', ':Lines<CR>')
      map('n', '<Leader>fzb', ':Buffers<CR>')
      map('n', '<Leader>fzc', ':Commits<CR>')
    end
  }
}
