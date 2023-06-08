return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = {
		"TSInstall",
		"TSModuleInfo",
		"TSBufEnable",
		"TSBufDisable",
	},

	opts = {
		ensure_installed = {
			"cpp",
			"python",
			"go",
			"rust",
			"markdown", "markdown_inline",
			"lua",
			"latex",
		},

		auto_install = true,

		highlight = { enable = true },
		indent = { enable = true },
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
