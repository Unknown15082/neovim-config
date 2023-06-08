return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = {} },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{ "filetype", icon_only = true, separator = "" },
					{ "filename", path = 1 },
				},
				lualine_x = {
					-- TODO: nvim-navic
				},
				lualine_y = {
					{ "diagnostic" },
				},
				lualine_z = { "location" },
			}
		}
	end,
}
