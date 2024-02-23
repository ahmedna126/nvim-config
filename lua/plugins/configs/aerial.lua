return {
    -- Code outline window for skimming and quick navigation
    "stevearc/aerial.nvim",
      -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("aerial").setup({
            log_level = "info",
            backends = { "treesitter", "lsp" },
            highlight_on_hover = true,
            attach_mode = "global",
            filter_kind = {
                "Class",
                "Field",
                "Variable",
                "Constructor", 
                "Enum",
                "Function",
                "Interface",
                "Module",
                "Method",
                "Struct",
            },
        })
    end,
}
