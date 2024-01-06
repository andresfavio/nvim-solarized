return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			filetypes = { "html", "xml", "lua" },
		})
	end,
}
