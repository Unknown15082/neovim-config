-- Load snippets in LuaSnip

return {
	{
		"L3MON4D3/LuaSnip",
		config = function(_, opts)
			require("luasnip").setup(opts)
			require("luasnip.loaders.from_lua").load({ paths = "~/latex/snippets/" })
			require("luasnip").config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
				update_events = { "TextChanged", "TextChangedI" },
			})
		end,
	},
	{
		"rafamadriz/friendly-snippets",
		enabled = false,
	},
}
