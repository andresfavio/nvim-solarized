-- Ruta del directorio para lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clonar el repositorio lazy.nvim si no está presente
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- última versión estable
		lazypath,
	})
end

-- Agregar la ruta al inicio de 'runtimepath' para cargar lazy.nvim
vim.opt.rtp:prepend(lazypath)

-- Configuración de lazy.nvim
require("lazy").setup({
	spec = {
		{ import = "plugins.ui" },
		{ import = "plugins.editor" },
		{ import = "plugins.coding" },
		{ import = "plugins.formatting" },
	},
	ui = {
		border = "rounded",
	},
	install = {
		colorscheme = { "solarized-osaka" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
