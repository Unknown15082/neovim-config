-- Configuration for lualine.nvim

return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		local icons = require("lazyvim.config").icons

		return {
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
				},
				lualine_x = {
					-- nvim-navic
					{
						function()
							return require("nvim-navic").get_location()
						end,

						cond = function()
							return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
						end,
					},
				},
				lualine_y = {
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
				},
				lualine_z = {
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
		}
	end,
}
