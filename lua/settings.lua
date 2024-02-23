-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
local utils = require("utils")

local options = {
	hlsearch = false, -- Set highlight on search
	number = true, -- Make line numbers default
	mouse = "a", -- Enable mouse mode
	clipboard = "unnamedplus", -- Sync clipboard between OS and Neovim and allows neovim to access the system clipboard
	breakindent = true, -- Enable break indent
	undofile = true, -- Save undo history
	ignorecase = true, -- Case-insensitive searching UNLESS \C or capital in search
	smartcase = true,
	updatetime = 250, -- Decrease update time
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	completeopt = "menuone,noselect", -- Set completeopt to have a better completion experience
	termguicolors = true, -- set term gui colors (most terminals support this) NOTE: You should make sure your terminal supports this
	backup = false, -- creates a backup file
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	splitkeep = "cursor",
	swapfile = false, -- creates a swapfile
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = false, -- highlight the current line
	relativenumber = false, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	softtabstop = 2,
	autoindent = true,
	sidescrolloff = 8,
	smarttab = true,
	laststatus = 3,
	termbidi = true,
	encoding = "utf-8",
	title = true,
	showcmd = true,
	inccommand = "split",
	backspace = { "start", "eol", "indent" },
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	foldlevelstart = 99,
	foldlevel = 99,
	foldenable = true,
	confirm = true,
	shiftround = true,
	hidden = true,
	incsearch = true,
	autoread = true,

	-- backupskip = { "/tmp/*", "/private/tmp/*" },
	-- shell = "fish",
}

for key, value in pairs(options) do
	vim.opt[key] = value
end

vim.cmd([[set fcs=eob:\ ]])
vim.cmd([[filetype plugin indent on]])

vim.cmd([[
      highlight ErrorMsg guifg=white guibg=#FF0000 ctermfg=white ctermbg=lightblue
      highlight WarningMsg guifg=white ctermfg=white guibg=#dea83c ctermbg=yellow
      highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
    ]])

utils.set_indent_sizes({ lua = 4, java = 4, json = 4 })

vim.opt.path:append({ "**" }) --finding files - search down into subfolders
vim.opt.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])


-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nvim-notify as default vim notification method
local _notify, notify = pcall(require, "notify")
if _notify then
	vim.notify = notify
end

-- UI theme
require("theme").set_active_theme("onedark")  -- or tokyonight
