-- Setup Discord Rich Presence

return {
	"andweeb/presence.nvim",
	opts = {
		-- General options
		neovim_image_text = "Neovim",
		enable_line_number = true,

		-- Text options
		editing_text = "Nuking %s",
		file_explorer_text = "Browsing %s",
		git_commit_text = "Commiting",
		plugin_manager_text = "Being unproductive",
		reading_text = "Scanning %s",
		workspace_text = "Destroying %s",
		line_number_text = "Line %s/%s",
	},
}
