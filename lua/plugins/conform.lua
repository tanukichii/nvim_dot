return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "black" },
			go = { "gofumpt", "goimports", "golines" },
		},
		format_on_save = {
			timeout_ms = 15000,
			lsp_fallback = true,
			async = false,
		},
	},
}
