return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = true,
	opts = {
		italic = {
			strings = false,
			comments = false,
			emphasis = false,
			folds = false,
		},
		transparent_mode = false,
	},
}

-- catppuccin
--[[
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		--		transparent_background = true,
		no_italic = true,
	},
}
]]
-- the colourscheme is initilised in the nvim/lua/config/options.lua file
