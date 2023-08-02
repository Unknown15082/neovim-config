return {
	-- Catppuccin colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},

	-- Tokyonight colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Kanagawa colorscheme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Nightfox colorscheme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Set default colorscheme
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight-night",
		},
	},
}
