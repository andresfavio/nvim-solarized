return {
	"b0o/incline.nvim",
	dependencies = { "craftzdog/solarized-osaka.nvim" },
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local colors = require("solarized-osaka.colors").setup()
		require("incline").setup({
			highlight = {
				groups = {
					InclineNormalNC = { guibg = "#00242e", guifg = "#99a5a6" },
					InclineNormal = { guibg = "#021820", guifg = "#99a5a6" },
				},
			},
			window = {
				margin = { vertical = 1, horizontal = 0 },
				padding = 2,
			},
			hide = {
				cursorline = true,
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if vim.bo[props.buf].modified then
					filename = "  " .. filename
				end

				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
				return { { icon, guifg = color }, { " " }, { filename } }
			end,
		})
	end,
}
