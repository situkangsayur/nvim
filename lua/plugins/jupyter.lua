return {
  {
    'Vigemus/iron.nvim',
    config = function()
      local iron = require('iron.core')

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              command = {'ipython', '--simple-prompt'},
              format = require("iron.fts.common").bracketed_paste,
            }
          },
          repl_open_cmd = require('iron.view').right(80),
        },
        keymaps = {
          send_motion = "<leader>sc",
          visual_send = "<leader>sc",
          send_line = "<leader>sl",
          send_mark = "<leader>sm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader>s<cr>",
          interrupt = "<leader>s<space>",
          exit = "<leader>sq",
          clear = "<leader>cl",
        },
        highlight = {
          italic = true
        },
        ignore_blank_lines = true,
      })

      -- Keybindings
      local map = vim.keymap.set
      map('n', '<leader>rs', '<cmd>IronRepl<cr>', { desc = 'Start REPL' })
      map('n', '<leader>rr', '<cmd>IronRestart<cr>', { desc = 'Restart REPL' })
      map('n', '<leader>rf', '<cmd>IronFocus<cr>', { desc = 'Focus REPL' })
      map('n', '<leader>rh', '<cmd>IronHide<cr>', { desc = 'Hide REPL' })
    end
  },
  {
    'goerz/jupytext.vim',
    ft = {'ipynb', 'python'},
    config = function()
      -- Configure jupytext format
      vim.g.jupytext_fmt = 'py:percent'
      vim.g.jupytext_enable = 1
    end
  }
}
