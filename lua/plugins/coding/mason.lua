return {
	"williamboman/mason.nvim", -- Paquete de mason.nvim
	cmd = "Mason",
	build = ":MasonUpdate",
	dependencies = {
		{ "williamboman/mason-lspconfig.nvim", cmd = "Mason" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim", cmd = "Mason" },
	},
	config = function()
		-- Importar mason
		local mason = require("mason")

		-- Importar mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- Habilitar mason y configurar iconos
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- Lista de servidores para que mason los instale
			ensure_installed = {
				"lua_ls",
				"pyright",
			},
			-- Autoinstalar servidores configurados (con lspconfig)
			automatic_installation = false, -- No es lo mismo que ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- Formateador de Lua
				"black", -- Formateador de Python
			},
		})
	end,
}
