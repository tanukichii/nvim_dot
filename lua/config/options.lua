-- set color theme
vim.cmd("colorscheme gruvbox")

vim.opt.termguicolors = true -- bufferline
require("bufferline").setup({})

-- toggle treesitter when launch
vim.cmd("TSToggle highlight")
