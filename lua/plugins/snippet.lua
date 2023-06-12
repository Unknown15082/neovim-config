return {
	"L3MON4D3/LuaSnip",
	lazy = true,
	version = "1.*",
	build = "make install_jsregexp",

	dependencies = {
		-- Snippets
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	opts = {
		history = true,
		delete_check_events = "TextChanged",
	}
}