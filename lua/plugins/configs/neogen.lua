return{
    "danymat/neogen",
		keys = {
			{
				"<leader>bb",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
	opts = { snippet_engine = "luasnip" },
}