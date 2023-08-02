-- Configure mini.indentscope

return {
	"echasnovski/mini.indentscope",
	opts = {
		draw = {
			delay = 20,
			animation = require("mini.indentscope").gen_animation.none(),
		},
	},
}
