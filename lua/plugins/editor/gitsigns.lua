return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	opts = {
		--sigcolumn = false,
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		numhl = false,
		max_file_length = 10000,
	},
}
