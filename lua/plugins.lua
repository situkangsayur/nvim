vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
end)