require("nvchad.options")

-- local o = vim.o
local opt = vim.opt

-- terminal general
opt.termguicolors = true
opt.guicursor = "i-ci:ver25-blinkwait500-blinkon500-blinkoff500"
opt.background = "dark"
opt.signcolumn = "yes"
opt.cursorline = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.previewheight = 30

-- editing
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.softtabstop = 4
opt.wrap = true
opt.linebreak = true
opt.textwidth = 80
opt.number = true
opt.numberwidth = 2
opt.ruler = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = false
opt.clipboard = "unnamedplus"

-- new things
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.formatoptions:append({ "r" })

opt.autochdir = true
