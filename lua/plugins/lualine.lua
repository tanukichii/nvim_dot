local function nijika()
	return [[伊地知虹夏]]
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		sections = { lualine_x = { "encoding", nijika, "filetype" } },
	},
}
