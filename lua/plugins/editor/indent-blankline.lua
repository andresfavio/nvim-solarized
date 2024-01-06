return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufEnter",
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = { enabled = true },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
	},
	main = "ibl",
}
-- return {
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	event = "BufEnter",
-- 	main = "ibl",
-- 	config = function()
-- 		local highlight = {
-- 			"RainbowRed",
-- 			"RainbowYellow",
-- 			"RainbowBlue",
-- 			"RainbowOrange",
-- 			"RainbowGreen",
-- 			"RainbowViolet",
-- 			"RainbowCyan",
-- 		}
-- 		local hooks = require("ibl.hooks")
-- 		-- create the highlight groups in the highlight setup hook, so they are reset
-- 		-- every time the colorscheme changes
-- 		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- 			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#db302d" })
-- 			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#b28500" })
-- 			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#268bd3" })
-- 			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#c74b16" })
-- 			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#819600" })
-- 			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#6c70c2" })
-- 			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#28a096" })
-- 		end)
--
-- 		vim.g.rainbow_delimiters = { highlight = highlight }
-- 		require("ibl").setup({
-- 			indent = {
-- 				char = "│",
-- 				tab_char = "│",
-- 			},
-- 			whitespace = { highlight = { "Whitespace", "NonText" } },
--
-- 			scope = { highlight = highlight },
-- 			exclude = {
-- 				filetypes = {
-- 					"help",
-- 					"alpha",
-- 					"dashboard",
-- 					"neo-tree",
-- 					"Trouble",
-- 					"trouble",
-- 					"lazy",
-- 					"mason",
-- 					"notify",
-- 					"toggleterm",
-- 					"lazyterm",
-- 				},
-- 			},
-- 		})
-- 		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- 	end,
-- }
