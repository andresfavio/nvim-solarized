return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	cmd = "Lspsaga",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			symbol_in_winbar = {
				enable = false,
			},
			implement = {
				enable = false,
			},
			ui = {
				devicon = false,
			},
		})
	end,
}
