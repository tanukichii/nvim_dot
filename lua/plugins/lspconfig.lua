-- ~/nvim/lua/slydragonn/plugins/lspconfig.lua

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	init = function()
		-- Reserve a space in the gutter
		-- this will avoid an annoying layout shift in the screen
		vim.opt.signcolumn = "yes"
	end,

	-- error and warning diagnostics
	vim.diagnostic.config({
		underline = true,
		update_in_insert = true,
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = "●", -- can change this symbol
		},
	}),
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local protocol = require("vim.lsp.protocol")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup({
			handlers = {
				function(server)
					nvim_lsp[server].setup({
						capabilities = capabilities,
					})
				end,

				["pyright"] = function()
					nvim_lsp["pyright"].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
			},
		})
	end,
}
