return {
  "gutsavgupta/nvim-gemini-companion",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gemini").setup({
      -- Panel kanan. Preset right-fixed mengunci lebar di 0.4 (di terminal.new
      -- preset selalu menang atas win.width), jadi Claude juga di-set 0.4
      -- supaya keduanya berbagi region kanan yang sama -> tidak menumpuk.
      win = {
        preset = "right-fixed",
      },
    })
  end,
  keys = {
    { "<leader>gg", "<cmd>GeminiToggle<cr>", desc = "Toggle Gemini sidebar" },
    { "<leader>gc", "<cmd>GeminiSwitchToCli<cr>", desc = "Spawn or switch to AI session" },
    { "<leader>gS", function() 
        vim.cmd('normal! gv')
        vim.cmd("'<,'>GeminiSend")
      end, mode = { 'x' }, desc = 'Send selection to AI' },
  }
}
