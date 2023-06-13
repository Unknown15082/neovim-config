return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			diagnostics = {
				
			},
			autoformat = true,
			format_notify = false,
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			local capabilities = lspconfig.util.default_config.capabilities
			capabilities = vim.tbl_deep_extend(
				"force",
				capabilities,
				require("cmp_nvim_lsp").default_capabilities()
			)
			
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(env)
					local opts = { buffer = env.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					vim.keymap.set({ "n", "v" }, "<Space>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- C++
				"clangd",
				-- Python
				"ruff_lsp",
				-- Go
				"gopls",
			},
			automatic_installation = true,
			handlers = {
				function (server)
					require("lspconfig")[server].setup {}
				end,
			},
		},
	},
}
