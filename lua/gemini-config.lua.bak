require("gemini").setup({
  cmds = { "gemini", "qwen" },
  -- Override default key mappings
  on_buf = function(buf)
    -- Add your own custom mappings
    vim.api.nvim_buf_set_keymap(buf, 't', '<C-1>', 
      '<Cmd>lua require("gemini.ideSidebar").switchSidebar()<CR>', 
      { noremap = true, silent = true }
    )
    vim.api.nvim_buf_set_keymap(buf, 't', '<C-1>', 
      '<Cmd>lua require("gemini.ideSidebar").switchSidebar("prev")<CR>', 
      { noremap = true, silent = true }
    )
  end
})

vim.keymap.set("n", "<leader>gg", "<cmd>GeminiToggle<cr>", { desc = "Toggle Gemini sidebar" })
vim.keymap.set("n", "<leader>gc", "<cmd>GeminiSwitchToCli<cr>", { desc = "Spawn or switch to AI session" })
vim.keymap.set("x", "<leader>gS", function() 
    vim.cmd('normal! gv')
    vim.cmd("'<,'>GeminiSend")
end, { desc = 'Send selection to AI' })
