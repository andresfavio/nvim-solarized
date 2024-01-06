-- Configuración de nvim-lspconfig
return {
	"neovim/nvim-lspconfig", -- Paquete de nvim-lspconfig
	dependencies = {
		-- "nvim-lua/lsp-status.nvim",
		{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		"williamboman/mason.nvim",
		-- "folke/neodev.nvim",
	},
	event = "VeryLazy",
	config = function()
		-- Función de activación para asociar comandos a eventos del LSP
		local on_attach = function(_, bufnr)
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
			local opts = { buffer = bufnr }

			-- Mapeos de teclas para diferentes funciones del LSP
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Lsp Declaración", buffer = bufnr })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Lsp Definición", buffer = bufnr })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp Información", buffer = bufnr })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Lsp Implementación", buffer = bufnr })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Lsp Ayuda de Firma", buffer = bufnr })
			vim.keymap.set(
				"n",
				"<leader>D",
				vim.lsp.buf.type_definition,
				{ desc = "Lsp Definición de Tipo", buffer = bufnr }
			)
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Acción de Código", buffer = bufnr })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Lsp Referencias", buffer = bufnr })
			vim.keymap.set("n", "fo", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "Formatear Archivo", buffer = bufnr })
		end

		-- Configuración del servidor LSP para Python
		require("lspconfig").pyright.setup({
			on_attach = on_attach,
			filetypes = { "python" },
			settings = {
				python = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			},
		})

		-- Configuración del servidor LSP para Lua
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})
	end,
}
