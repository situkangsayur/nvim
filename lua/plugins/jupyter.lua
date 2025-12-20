return {
  {
    'Vigemus/iron.nvim',
    config = function()
      require('iron').setup({
        config = {
          -- iron.nvim configuration for jupyter
          -- you might need to install jupyter kernel for your language
          -- e.g., pip install ipykernel for python
          repl_definition = {
            python = {
              command = {'ipython', '--simple-prompt'}
            }
          },
          repl_open_cmd = 'vsplit_DEFAULT'
        }
      })
    end
  },
  { 'goerz/jupytext.vim' }
}
