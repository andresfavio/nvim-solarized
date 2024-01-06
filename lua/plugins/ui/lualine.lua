return {
	"nvim-lualine/lualine.nvim",
	-- event = "BufEnter",
	event = "BufWinEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")
		local devicons = require("nvim-web-devicons")
		local vim = vim

		local colors = {
			blue = "#176da8",
			green = "#869a00",
			violet = "#ff61ef",
			yellow = "#ae8200",
			red = "#ff4a4a",
			fg = "#888e9a",
			bg = "#001014",
			inactive_bg = "#2c3043",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}
		local function get_status_line()
			local current_file = vim.fn.expand("%:t")
			local icon, _ = require("nvim-web-devicons").get_icon(current_file, vim.fn.expand("%:e"))
			local file_icon = icon or ""

			local clients = vim.lsp.get_active_clients() or {}
			local lsp_status = ""
			if next(clients) ~= nil then
				local client_names = {}
				for _, client in pairs(clients) do
					table.insert(client_names, client.name)
				end
				lsp_status = " LSP: " .. table.concat(client_names, ", ")
			else
				lsp_status = " LSP: inactivo"
			end

			return file_icon .. lsp_status
		end

		local function codeium()
			return [[ ]]
		end
		-- configure lualine with modified theme
		lualine.setup({
			globalstatus = true,
			options = {
				globalstatus = true,
				theme = my_lualine_theme,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"", -- separador
					{ "branch", icon = { "󰊢" }, color = { fg = "#9eabac" } },
					get_status_line,
				},
				lualine_c = {},
				lualine_x = {
					{
						"diff",
						icons_color = { added = colors.green, modified = colors.yellow, removed = colors.red },
						symbols = { added = " ", modified = " ", removed = " " },
					},
					"diagnostics",
					function()
						local fileformat = vim.bo.fileformat
						local icon = " " -- ícono de arch linux
						return icon .. " " .. fileformat:upper()
					end,
					{
						codeium,
						color = { fg = "#849900" },
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {},
				lualine_z = {
					function()
						return "  " .. os.date("%H:%M")
					end,
				},
			},
			extensions = { "nvim-tree", "lazy" },
		})

		-- configurar devicons para lualine
		devicons.setup({
			override = {
				diff = {
					added = {
						icon = "",
						color = colors.green,
						name = "diffadded",
					},
					modified = {
						icon = "",
						color = colors.yellow,
						name = "diffmodified",
					},
					removed = {
						icon = "",
						color = colors.red,
						name = "diffremoved",
					},
				},
			},
		})
	end,
}
