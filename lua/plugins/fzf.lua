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

      -- Use GFiles when inside a git repo, otherwise fall back to Files so
      -- the picker always shows results.
      vim.api.nvim_create_user_command('FZFSmart', function()
        local in_git = vim.fn.systemlist('git rev-parse --is-inside-work-tree 2>/dev/null')[1] == 'true'
        if in_git then
          vim.cmd('GFiles --exclude-standard --others --cached')
        else
          vim.cmd('Files')
        end
      end, {})

      map('n', '<C-p>', ':FZFSmart<CR>', { silent = true })
      map('i', '<C-i>', '<Esc>:FZFSmart<CR>', { silent = true })
      map('n', '<C-B>', ':Buffers<CR>')
      map('n', '<C-L>', ':Lines<CR>')
      map('n', '<Leader>fzl', ':Lines<CR>')
      map('n', '<Leader>fzb', ':Buffers<CR>')
      map('n', '<Leader>fzc', ':Commits<CR>')
      map('n', '<Leader>fzf', ':Files<CR>')
    end
  }
}
