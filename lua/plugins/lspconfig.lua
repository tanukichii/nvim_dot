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

		vim.lsp.config.clangd = {
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = {
				"clangd",
				"-j=" .. 2,
				"--background-index",
				"--clang-tidy",
				"--inlay-hints",
				"--fallback-style=llvm",
				"--all-scopes-completion",
				"--completion-style=detailed",
				"--header-insertion=never",
				"--header-insertion-decorators",
				"--pch-storage=memory",
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_markers = {
				"CMakeLists.txt",
				".clangd",
				".clang-tidy",
				".clang-format",
				"compile_commands.json",
				"compile_flags.txt",
				"configure.ac",
				".git",
				vim.uv.cwd(),
			},
		}
		vim.lsp.enable("clangd")

		vim.lsp.config.pyright = {
			on_attach = on_attach,
			capabilities = capabilities,
		}
		vim.lsp.enable("pyright")
	end,
}
