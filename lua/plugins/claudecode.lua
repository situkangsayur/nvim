return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup({
      -- floating terminal via snacks.nvim
      terminal = {
        provider = "snacks",
        split_side = "right",
        split_width_percentage = 0.35,
      },
    })
  end,
  keys = {
    { "<leader>k", nil, desc = "Claude Code" },
    { "<leader>kc", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>kf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>kr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude session" },
    { "<leader>kC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude session" },
    { "<leader>km", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>kb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
    { "<leader>ks", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    -- diff review
    { "<leader>ky", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>kn", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  },
}
