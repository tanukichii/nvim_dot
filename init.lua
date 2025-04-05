require("config.lazy")
require("config.keymaps")
require("config.options")
require("keymaps")
require("options")
require("config.autocmds")

-- Set the defualt shell to powershell
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	vim.opt.shell = "pwsh"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.opt.shellquote = '"'
	vim.opt.shellxquote = ""
end
