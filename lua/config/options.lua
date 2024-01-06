-- Archivo: options.lua
-- Este archivo se carga automáticamente a través de plugins.core

-- Configuración global de Vim
vim.g.mapleader = "."
vim.g.maplocalleader = "\\"
vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.g.markdown_recommended_style = 0
vim.o.statusline = " "
vim.o.laststatus = 3
vim.o.cmdheight = 1
vim.g.lualine_laststatus = vim.o.laststatus
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo/" -- Directorio para undo files
vim.g.snippets = "luasnip"

-- Neovide

if vim.g.neovide then
	vim.g.neovide_transparency = 0.8

	vim.g.neovide_scroll_animation_length = 0.5

	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0
	-- vim.g.transparency = 0.8
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_refresh_rate = 60
	vim.o.guifont = "Iosevka Nerd Font:h13"
	vim.opt.linespace = 0
	vim.g.neovide_scale_factor = 1.0

	vim.g.neovide_confirm_quit = true
	vim.g.neovide_padding_top = 10
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 2

	vim.g.neovide_confirm_quit = true
	vim.g.neovide_floating_shadow = false
	vim.g.neovide_floating_z_height = 0
	vim.g.neovide_light_angle_degrees = 0
	vim.g.neovide_light_radius = 0
end

-- Configuración de opciones de Neovim
local opt = vim.opt
opt.autowrite = true -- Habilitar autoguardado automático
opt.numberwidth = 3
opt.clipboard = "unnamedplus" -- Sincronizar con el portapapeles del sistema
-- opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Ocultar marcas * para negrita e itálica
opt.confirm = true -- Confirmar antes de guardar cambios en un buffer modificado
opt.cursorline = true -- Resaltar la línea actual
opt.expandtab = true -- Usar espacios en lugar de tabulaciones
opt.formatoptions = "jcroqlnt" -- Opciones de formato
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignorar mayúsculas y minúsculas en búsquedas
opt.inccommand = "nosplit" -- Vista previa de sustitución incremental

-- opt.laststatus = 0 -- Desactivar la línea de estado global

opt.list = true -- Mostrar algunos caracteres invisibles (tabuladores...)
opt.mouse = "a" -- Habilitar el modo ratón
opt.number = true -- Mostrar números de línea
opt.relativenumber = true -- Números relativos
opt.scrolloff = 10 -- Líneas de contexto
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Ajustar la sangría redondeando
opt.shiftwidth = 2 -- Tamaño de la sangría
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- No mostrar el modo ya que se usa una línea de estado
opt.sidescrolloff = 8 -- Columnas de contexto
opt.signcolumn = "yes" -- Mostrar siempre la columna de signos
opt.smartcase = true -- No ignorar mayúsculas en búsquedas con mayúsculas
opt.smartindent = true -- Insertar sangrías automáticamente
opt.spelllang = { "en" }
opt.splitbelow = true -- Colocar nuevas ventanas debajo de la actual
opt.splitkeep = "screen"
opt.splitright = true -- Colocar nuevas ventanas a la derecha de la actual
opt.tabstop = 2 -- Número de espacios que cuenta como una tabulación
opt.termguicolors = true -- Soporte de color verdadero
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Guardar el archivo de intercambio y activar CursorHold
opt.virtualedit = "block" -- Permitir que el cursor se mueva donde no hay texto en modo de bloque visual
opt.wildmode = "longest:full,full" -- Modo de completación en línea de comandos
opt.winminwidth = 5 -- Ancho mínimo de la ventana
opt.wrap = false -- Desactivar el ajuste de línea
opt.background = "dark" -- Usar temas oscuros
opt.foldlevel = 99
opt.backup = false -- No generar copias de seguridad
opt.swapfile = false -- No generar archivos de intercambio
opt.formatexpr = "v:lua.require'conform'.formatexpr()"
-- opt.cmdheight = 0
opt.equalalways = false
opt.splitkeep = "screen"
opt.shortmess = "filnxtToOFWIcC"
opt.synmaxcol = 240 -- Limitar el color de sintaxis para mejorar el rendimiento
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Configuración específica para versiones de Neovim 0.10 o superiores
if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true -- Habilitar desplazamiento suave
end
