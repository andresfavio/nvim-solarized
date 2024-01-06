return {
	"FabianWirth/search.nvim",
	cmd = "Telescope",
	config = function()
		local builtin = require("telescope.builtin")
		require("search").setup({
			mappings = {
				next = "<Tab>",
				prev = "<S-Tab>",
			},
			tabs = {
				{
					"Files",
					builtin.find_files,
				},
				{
					"Grep",
					builtin.live_grep,
				},
				{
					"Fuzzy",
					builtin.current_buffer_fuzzy_find,
				},
				{
					"Help",
					builtin.help_tags,
				},
				{
					"Config",
					function()
						require("telescope.builtin").find_files({
							prompt_title = "Config",
							cwd = "~/.config/nvim/lua",
						})
					end,
				},
			},
		})
	end,
}
