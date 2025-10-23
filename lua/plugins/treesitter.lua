return {
	"nvim-treesitter/nvim-treesitter",

	opts = {
		highlight = {
			enable = true,

			-- disable = {} list of disabled treesitter

			disable = function(lang, buf) -- disable for large filesize
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		indent = { enable = true },
		ensure_installed = {
			"c",
			"cpp",
			"python",
		},
	},
}
