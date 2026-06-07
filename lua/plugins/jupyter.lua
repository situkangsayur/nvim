-- Jupyter / REPL stack
--   iron.nvim     : ringan, REPL teks di split (kirim baris/blok ke ipython)
--   molten-nvim   : jalankan sel ke Jupyter kernel, output INLINE (teks + plot)
--   image.nvim    : render gambar via kitty graphics (processor magick CLI)
--   jupytext.vim  : edit .ipynb sebagai .py (percent format)
--
-- Python host pakai venv khusus (deps: jupyter_client, ipykernel, nbformat, ...)
vim.g.python3_host_prog = vim.fn.expand('~/.local/share/nvim/molten-venv/bin/python')

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

  -- Render gambar pakai kitty graphics protocol (tanpa luarocks: magick CLI)
  {
    '3rd/image.nvim',
    config = function()
      require('image').setup({
        backend = 'kitty',
        processor = 'magick_cli',
        integrations = {}, -- molten yang panggil, bukan auto-render markdown
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', '' },
      })
    end,
  },

  -- Jalankan sel notebook -> output inline (teks + plot)
  {
    'benlubas/molten-nvim',
    version = '^1.0.0',
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    init = function()
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = true  -- output sebagai virtual text di bawah sel
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    config = function()
      local map = vim.keymap.set
      map('n', '<leader>ji', '<cmd>MoltenInit<cr>',                 { desc = 'Molten: init kernel' })
      map('n', '<leader>jl', '<cmd>MoltenEvaluateLine<cr>',         { desc = 'Molten: eval line' })
      map('n', '<leader>je', '<cmd>MoltenEvaluateOperator<cr>',     { desc = 'Molten: eval operator (mis. jeip)' })
      map('v', '<leader>j',  ':<C-u>MoltenEvaluateVisual<cr>gv',    { desc = 'Molten: eval selection' })
      map('n', '<leader>jc', '<cmd>MoltenReevaluateCell<cr>',       { desc = 'Molten: re-eval cell' })
      map('n', '<leader>jd', '<cmd>MoltenDelete<cr>',               { desc = 'Molten: delete cell' })
      map('n', '<leader>jo', '<cmd>noautocmd MoltenEnterOutput<cr>',{ desc = 'Molten: enter output window' })
      map('n', '<leader>jh', '<cmd>MoltenHideOutput<cr>',           { desc = 'Molten: hide output' })
      map('n', '<leader>js', '<cmd>MoltenShowOutput<cr>',           { desc = 'Molten: show output' })
      map('n', '<leader>jr', '<cmd>MoltenRestart!<cr>',             { desc = 'Molten: restart kernel' })
      map('n', '<leader>jx', '<cmd>MoltenInterrupt<cr>',            { desc = 'Molten: interrupt' })
      -- import/export ke .ipynb (output ikut tersimpan)
      map('n', '<leader>jI', '<cmd>MoltenImportOutput<cr>',         { desc = 'Molten: import .ipynb output' })
      map('n', '<leader>jE', '<cmd>MoltenExportOutput<cr>',         { desc = 'Molten: export ke .ipynb' })
    end,
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
