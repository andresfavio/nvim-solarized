return {
	"rcarriga/nvim-notify",
	opts = {
		background_colour = "NotifyBackground",
		fps = 60,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = 2,
		render = "wrapped-compact",
		stages = "slide",
		timeout = 700,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
		top_down = true,
	},
}
