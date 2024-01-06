-- Configuración de nvim-cmp
return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip-integ",
		"onsails/lspkind.nvim",
	},
	opts = function()
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local lspkind = require("lspkind")
		local cmp_kinds = {
			-- ... (definición de iconos para diferentes tipos)
			Text = " |   ",
			Method = " |   ",
			Function = " |   ",
			Constructor = " |   ",
			Field = " |   ",
			Variable = " |   ",
			Class = " |   ",
			Interface = " |   ",
			Module = " |   ",
			Property = " |   ",
			Unit = " |   ",
			Value = " |   ",
			Enum = " |   ",
			Keyword = " |   ",
			Snippet = " |   ",
			Color = " |   ",
			File = " |   ",
			Reference = " |   ",
			Folder = " |   ",
			EnumMember = " |   ",
			Constant = " |   ",
			Struct = " |   ",
			Event = " |   ",
			Operator = " |   ",
			TypeParameter = " |   ",
			Codeium = " |   ",
		}
		return {
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done()),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = {
				-- Mapeos de teclas para la navegación y autocompletado
				["<TAB>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<S-TAB>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-k>"] = cmp.mapping.scroll_docs(-4),
				["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
				["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				["<C-CR>"] = function(fallback)
					cmp.abort()
					fallback()
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
				{ name = "codeium" },
				{ name = "luasnip" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
			formatting = {
				format = function(_, item)
					if cmp_kinds[item.kind] then
						item.kind = cmp_kinds[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = {
				ghost_text = true,
			},
			sorting = defaults.sorting,
		}
	end,
	---@param opts cmp.ConfigSchema
	config = function(_, opts)
		for _, source in ipairs(opts.sources) do
			source.group_index = source.group_index or 1
		end
		require("cmp").setup(opts)
	end,
}
