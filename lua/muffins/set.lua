--settings for several vim options

vim.cmd("colorscheme rose-pine-dawn")

--set tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--set relativenumbers for quick up and down movement
vim.opt.relativenumber = true
vim.opt.nu = true

--set auto indenting for C programs
vim.opt.smartindent = true

--prevents line wrapping
vim.opt.wrap = false

--removes highlighting remaining after use but keeps incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--all the colors
vim.opt.termguicolors = true

--keeps at least 8 lines of code visible when scrolling up
vim.opt.scrolloff = 8

--saves to buffer after set amount of time without typing
vim.opt.updatetime = 50

--sets color column so I will know when to start a new line
vim.opt.colorcolumn = "80"

--maps leader key to space key
vim.g.mapleader = " "
