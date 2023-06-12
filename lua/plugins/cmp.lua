return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"saadparwaiz1/cmp_luasnip",
		"kdheepak/cmp-latex-symbols",

		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
	},

	opts = function()
		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local luasnip = require("luasnip")
		local cmp = require("cmp")

		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = vim.tbl_deep_extend(
					"force",
					cmp.config.window.bordered(),
					{ scrollbar = false }
				),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "latex_symbols" },
				{ name = "nvim_lua" },
			}),

			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[BUF]",
						nvim_lsp = "[LSP]",
						luasnip = "[SNIP]",
						nvim_lua = "[LUA]",
						latex_symbols = "[TEX]",
					},

					symbol_map = {
						Class = "󰠱",
						Color = "󰏘",
						Constant = "󰏿",
						Constructor = "",
						Enum = "",
						EnumMember = "",
						Event = "",
						Field = "󰇽",
						File = "󰈙",
						Folder = "󰉋",
						Function = "󰊕",
						Interface = "",
						Keyword = "󰌋",
						Method = "󰆧",
						Module = "",
						Namespace = "󰌗",
						Number = "",
						Operator = "󰆕",
						Package = "",
						Property = "󰜢",
						Reference = "",
						Snippet = "",
						Struct = "",
						Text = "󰉿",
						TypeParameter = "󰅲",
						Undefined = "",
						Unit = "",
						Value = "󰎠",
						Variable = "",
					},
				})
			}
		}
	end,
}
