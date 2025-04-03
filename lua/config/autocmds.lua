vim.api.nvim_create_autocmd("InsertEnter", { command = [[set norelativenumber]] })

vim.api.nvim_create_autocmd("InsertLeave", { command = [[set relativenumber]] })
