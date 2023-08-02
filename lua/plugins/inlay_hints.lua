-- Enable inlay hints for nvim >= 0.10

return {
	"neovim/nvim-lspconfig",
	opts = {
		inlay_hints = { enabled = vim.fn.has("nvim-0.10") == 1 },
	},
}
