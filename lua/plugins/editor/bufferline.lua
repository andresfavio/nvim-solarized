return {
	"akinsho/bufferline.nvim",
	enabled = false,
	event = "VeryLazy",
	opts = {},
	config = function()
		require("bufferline").setup({
			options = {
				custom_filter = function(buf_number)
					local buflist = vim.fn.getbufinfo({ buflisted = 1 })
					for _, buf in ipairs(buflist) do
						if buf.bufnr == buf_number then
							return not vim.fn.bufname(buf.bufnr):match("^term://")
						end
					end
					return true
				end,
				-- mode = "tabs",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		})
	end,
}
