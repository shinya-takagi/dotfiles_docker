-- ==================================
--    Neovim General Setting
-- ==================================

local vo = vim.o
local opt = vim.opt

-- file encoding
vo.encoding = true
vo.fileencodings = "utf-8"
vim.cmd("filetype", "plugin", "indent", "on")
vim.cmd("syntax", "on")

-- colorscheme
vo.background = "dark"

-- General setting
opt.number = true
vo.ruler = true
vo.title = true
vo.showcmd = true
vo.showmatch = true
opt.autoindent = true
vo.wildmenu = true
vo.wildmode = "full"
opt.swapfile = false
opt.cursorline = true
vo.incsearch = true
vo.hlsearch = true
vo.ignorecase = true
-- Tab Setting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.softtabstop = 4
