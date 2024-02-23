local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")

if not ok then
	return
end

local theme = require("theme")

local plugins = {
	---- UI
	theme.get_active_theme(),
	"kevinhwang91/nvim-bqf",
	"liuchengxu/vista.vim",
	require("plugins.configs.noice"),	-- messages, cmdline and the popupmenu
	"mhinz/vim-startify", -- Start page,
	'b0o/incline.nvim',  --Floating statuslines for Neovim
	'echasnovski/mini.animate',  -- animate common Neovim actions
	"aktersnurra/no-clown-fiesta.nvim",
	'echasnovski/mini.hipatterns', -- Highlight patterns in text. Part of 'mini.nvim' library.
	require("plugins.configs.plugins"),
	require("plugins.configs.neogen"), -- A better annotation generator
	require("plugins.configs.barbecue"), -- A VS Code like winbar for Neovim
	"kyazdani42/nvim-web-devicons",
	"onsails/lspkind.nvim", -- VSCode like item type icons
	"echasnovski/mini.bracketed", -- Go forward/backward with square brackets
	require("plugins.configs.bufferline"),
	"folke/which-key.nvim",
	require("plugins.configs.neoscroll"), -- Smoother scroll
	require("plugins.configs.ufo"), -- Better fold management
	require("plugins.configs.scrollbar"),
	require("plugins.configs.trouble"),
	require("plugins.configs.aerial"),
	require("plugins.configs.edgy"), -- Layout configurations
	require("plugins.configs.hydra"),
	"rcarriga/nvim-notify", -- Popup notifications
	"mbbill/undotree",
	require("plugins.configs.neotree"),
	require("plugins.configs.lualine"),
	require("plugins.configs.treesitter"),
	---- Utilities
	require("plugins.configs.telescope"),
	"terryma/vim-expand-region", -- Incremental selection expansion
	require("plugins.configs.autopairs"),
	require("plugins.configs.dial"), -- Extended increment/decrement functions
	require("plugins.configs.surround"), -- Autochange open/close chars
	-- require("plugins.configs.colorizer"), -- Colorize written color codes (#02F1AA, rgb(0,10,20)...)
	require("plugins.configs.neoclip"), -- Clipboard manager
	require("plugins.configs.toggleterm"), --- Improved terminal toggle
    require("plugins.configs.illuminate"), --- Automatically highlighting other uses of the word under the cursor
	require("plugins.configs.project"), -- Project management
	"sitiom/nvim-numbertoggle", -- Automatic switch to absolute line numbers when you are not in normal or visual mode, or focus is in other split
	require("plugins.configs.zen"),
	"chrisgrieser/nvim-spider",
	require("plugins.configs.textobjs"),
	require("plugins.configs.comment"),
	require("plugins.configs.flash"),
	require("plugins.configs.todo"),
--	require("plugins.configs.harpoon"),
	require("plugins.configs.bigfile"),
--	require("plugins.configs.splitjoin"), -- Quick split or join of lists ...... i use treejs and ts-node-action
	---- Code
	require("plugins.configs.lspsaga"),
	require("plugins.configs.refactor"),
	require("plugins.configs.lens"),
	require("plugins.configs.conform"), -- Formatting tool
    require("plugins.configs.glance"),

	---- LSP/DAP
	require("plugins.configs.mason"),
	"neovim/nvim-lspconfig",
    require("lsp.configs.dap"),
	require("lsp.configs.java"),
--	require("lsp.configs.rust"),
--	require("lsp.configs.python"),

	---- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	---- Completion
    require("plugins.configs.coq"),
	require("plugins.configs.cmp"),
	require("plugins.configs.lspsignature"),
--	require("plugins.configs.copilot"),
	-- Tmux
	require("plugins.configs.tmux"),
	---- Git
	require("plugins.configs.diffview"),
	require("plugins.configs.gitsigns"), -- Add git related info in the signs columns and popups
}

-- vim.api.nvim_echo({ { 'Active theme: ' .. theme.theme_name, "Normal" } }, true, {});
lazy.setup(plugins)


---------------------------------------------------

require("lazy").setup({
	spec = {
		-- add LazyVim and import its plugins
		{
			"LazyVim/LazyVim",
			import = "lazyvim.plugins",
			opts = {
				--colorscheme = "onedark",
				news = {
					lazyvim = true,
					neovim = true,
				},
			},
		},
		-- import any extras modules here
		{ import = "lazyvim.plugins.extras.linting.eslint" },
		{ import = "lazyvim.plugins.extras.formatting.prettier" },
		{ import = "lazyvim.plugins.extras.lang.java" },
		-- { import = "lazyvim.plugins.extras.coding.copilot" },
		{ import = "lazyvim.plugins.extras.dap.core" },
		{ import = "lazyvim.plugins.extras.vscode" },
		-- { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
		{ import = "lazyvim.plugins.extras.test.core" },
		-- { import = "lazyvim.plugins.extras.coding.yanky" },
		{ import = "lazyvim.plugins.extras.editor.mini-files" },
		{ import = "lazyvim.plugins.extras.lsp.none-ls" },
		-- { import = "lazyvim.plugins.extras.util.project" },
		-- { import = "plugins" },
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	dev = {
		path = "~/.ghq/github.com",
	},
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		cache = {
			enabled = true,
			-- disable_events = {},
		},
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"rplugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		custom_keys = {
			["<localleader>d"] = function(plugin)
				dd(plugin)
			end,
		},
	},
	-- debug = false,
})
