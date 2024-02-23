return{
    {
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		opts = {},
		lazy = false,
		keys = {
			{
				"X",
				function()
					require("ts-node-action").node_action()
				end,
				desc = "Trigger node action",
			},
		},
	},
    {
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		keys = { 'sj' },
		config = function()
			require('treesj').setup({ use_default_keymaps = false })
			-- TreeSJ Keymaps
			local keymap = vim.keymap
			keymap.set('n', 'sj', ':TSJToggle<cr>', { desc = "Toggle split/join block", silent = true })
		end
	},
    -- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		keys = {
			{
				"<leader>rc",
				function()
					return ":IncRename " .. vim.fn.expand("<cword>")
				end,
				expr = true,
				desc = "lsp: incremental rename",
			},
		},
		config = function()
			require("inc_rename").setup()
		end,
	},

	{
		"AckslD/muren.nvim",
		config = true,
		event = "VeryLazy",
		cmd = "MurenToggle",
		keys = {
			{
				"<leader>rr",
				function()
					vim.cmd([[MurenToggle]])
				end,
				desc = "[muren]Multiple replacements in neovim",
			},
		},
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>vc", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		keys = {
			'ys',
			'ds',
			'cs',
			{ 'S', mode = 'x' },
			{ '<C-g>s', mode = 'i' },
		  },
		  config = function()
			require('configs.nvim-surround')
		  end,
	},

	


}