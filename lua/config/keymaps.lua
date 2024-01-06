-- configurando keymap
local keymap = vim.keymap

-- Agrega este mapeo en tu archivo de configuración de Neovim
keymap.set("n", "<leader>ff", '<cmd>lua require("search").open()<CR>', { noremap = true, silent = true })

-- Continuar con la escritura y centrar codigo
keymap.set("n", "o", "o<ESC>zzi", { noremap = true, silent = true })
keymap.set("n", "O", "O<ESC>zzi", { noremap = true, silent = true })

keymap.set("n", "j", 'v:count ? "j" : "gj"', { noremap = true, expr = true, silent = true })
keymap.set("n", "k", 'v:count ? "k" : "gk"', { noremap = true, expr = true, silent = true })

keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "descripcion", noremap = true, silent = true })

-- Eliminar palabras dentro y fuera de los signos
keymap.set("n", "d", "di", { desc = "Eliminar palabra" })
keymap.set("n", "dd", "dd", { desc = "Eliminar palabra" })

-- Cambiar palabras dentro y fuera de los signos
keymap.set("n", "c", "ci", { desc = "Cambiar palabra" })

-- Eliminar línea
keymap.set("n", "dl", "dd0", { desc = "Eliminar línea de código" })

-- Comandos para cambiar entre tabs
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Nuevo tab", noremap = true, silent = true })
keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Cerrar otros tabs", noremap = true, silent = true })
keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Cerrar tab actual", noremap = true, silent = true })
keymap.set("n", "<leader>th", "<cmd>tabnext<CR>", { desc = "Ir al siguiente tab", noremap = true, silent = true })
keymap.set("n", "<leader>tl", "<cmd>tabprev<CR>", { desc = "Ir al tab anterior", noremap = true, silent = true })

-- Navegación
keymap.set("i", "<A-Up>", "<C-\\><C-N><C-w>k", { desc = "Navegación hacia arriba" })
keymap.set("i", "<A-Down>", "<C-\\><C-N><C-w>j", { desc = "Navegación hacia abajo" })
keymap.set("i", "<A-Left>", "<C-\\><C-N><C-w>h", { desc = "Navegación hacia la derecha" })
keymap.set("i", "<A-Right>", "<C-\\><C-N><C-w>l", { desc = "Navegación hacia la izquierda" })

-- Mover Líneas
keymap.set(
	{ "n", "i" },
	"<A-j>",
	"<Esc>:m .+1<CR>==gi",
	{ desc = "Mover línea de código hacia abajo", noremap = true, silent = true }
)
keymap.set(
	{ "n", "i" },
	"<A-k>",
	"<Esc>:m .-2<CR>==gi",
	{ desc = "Mover línea de código hacia arriba", noremap = true, silent = true }
)

-- Seleccionar todo
keymap.set("n", "<C-a>", "ggVG", { desc = "Seleccionar todo" })

-- Modo normal
keymap.set("i", "jk", "<ESC>", { desc = "Entrar en modo normal" })

-- Modo comando
keymap.set("n", ".", ":", { desc = "Entrar en modo comando" })

-- Identación
keymap.set("v", "<", "<gv", { desc = "Mover línea hacia la izquierda" })
keymap.set("v", ">", ">gv", { desc = "Mover línea hacia la derecha" })

-- Guardar y salir
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Guardar", noremap = true, silent = true })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Salir", noremap = true, silent = true })
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Guardar y Salir", noremap = true, silent = true })

-- Neotree Float
keymap.set("n", "ne", "<cmd>Neotree float toggle<CR>", { desc = "NeoTree Float", noremap = true, silent = true })

-- Abrir ventanas
keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Abrir ventana vertical", noremap = true, silent = true })
keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Abrir ventana horizontal", noremap = true, silent = true })

-- Cerrar ventana y cerrar buffer
keymap.set("n", "<leader>wd", "<cmd>Bdelete<CR>", { desc = "Cerrar Buffer", noremap = true, silent = true })

-- Comandos para cambiar entre ventanas
keymap.set("n", "wh", "<cmd>wincmd h<CR>", { desc = "Mover a la ventana izquierda", noremap = true, silent = true })
keymap.set("n", "wj", "<cmd>wincmd j<CR>", { desc = "Mover a la ventana de abajo", noremap = true, silent = true })
keymap.set("n", "wk", "<cmd>wincmd k<CR>", { desc = "Mover a la ventana de arriba", noremap = true, silent = true })
keymap.set("n", "wl", "<cmd>wincmd l<CR>", { desc = "Mover a la ventana derecha", noremap = true, silent = true })

-- Navegar entre ventanas
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover hacia la ventana derecha" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover hacia la ventana izquierda" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover hacia la ventana de abajo" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover hacia la ventana de arriba" })

-- Cambiar tamaño de ventanas
keymap.set(
	"n",
	"<C-Up>",
	"<cmd>resize -2<CR>",
	{ desc = "Cambiar tamaño hacia arriba", noremap = true, silent = true }
)
keymap.set(
	"n",
	"<C-Down>",
	"<cmd>resize +2<CR>",
	{ desc = "Cambiar tamaño hacia abajo", noremap = true, silent = true }
)
keymap.set(
	"n",
	"<C-Left>",
	"<cmd>vertical resize -2<CR>",
	{ desc = "Cambiar tamaño hacia la derecha", noremap = true, silent = true }
)
keymap.set(
	"n",
	"<C-Right>",
	"<cmd>vertical resize +2<CR>",
	{ desc = "Cambiar tamaño hacia la izquierda", noremap = true, silent = true }
)

-- Cambiar Nombre
keymap.set("n", "<leader>rn", ":IncRename ", { desc = "Renombrar", noremap = true, silent = true })

-- Cerrar búsqueda con /
keymap.set(
	{ "i", "n" },
	"<ESC>",
	"<cmd>noh<CR><ESC>",
	{ desc = "Salir de modo búsqueda", noremap = true, silent = true }
)

-- Moverse entre buffers
keymap.set("n", "<TAB>", "<cmd>bn<cr>", { desc = "Mover al siguiente Buffer", noremap = true, silent = true })
keymap.set("n", "<S-TAB>", "<cmd>bp<cr>", { desc = "Mover al anterior Buffer", noremap = true, silent = true })

-- Iniciar la terminal
keymap.set(
	{ "n", "t" },
	"<A-1>",
	"<cmd>Lspsaga term_toggle<cr>",
	{ desc = "Abrir Terminal Flotante", noremap = true, silent = true }
)

-- Recargar keymaps
keymap.set("n", "<leader>r", "<cmd>so %<CR>", { desc = "Recargar configuración", noremap = true, silent = true })

-- Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Abrir Lazy", noremap = true, silent = true })

-- Nuevo archivo
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Nuevo archivo", noremap = true, silent = true })

-- Lsp diagnosticos
keymap.set("n", "die", vim.diagnostic.open_float, { desc = "Mostrar el diagnostico en el archivo" })
keymap.set("n", "dip", vim.diagnostic.goto_prev, { desc = "Anterior error de diagnostico" })
keymap.set("n", "din", vim.diagnostic.goto_next, { desc = "Siguiente error de diagnostico" })
keymap.set("n", "dil", vim.diagnostic.setloclist, { desc = "Lista de error de diagnostico" })

-- Configura el keymap
keymap.set("n", "<Leader>fg", function()
	require("telescope.builtin").find_files({})
end, { noremap = true, silent = true })

-- telescope dropdown
local no_preview = function()
	return require("telescope.themes").get_dropdown({
		layout_config = {
			-- height = 30,
			prompt_position = "top",
		},
		previewer = false,
		prompt_title = false,
	})
end

-- telescope
local search = function()
	return require("telescope.themes").get_dropdown({
		layout_config = {
			height = 25,
			width = 0.9,
			prompt_position = "top",
		},
		previewer = false,
		prompt_title = "Busqueda de codigo",
	})
end

-- busqueda de archivos
keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").find_files(no_preview())
end, { noremap = true, silent = true })

-- Busqueda en el archivo actual
keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").current_buffer_fuzzy_find(search())
end, { desc = "Busqueda de codigo en el buffer actual", noremap = true, silent = true })
