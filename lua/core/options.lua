local opt = vim.opt

-- General
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.termguicolors = true
opt.confirm = true

-- UI
opt.number = true
opt.relativenumber = true
opt.conceallevel = 3
opt.cursorline = true
opt.laststatus = 0
-- opt.showmode = false
opt.pumblend = 10
opt.pumheight = 10
opt.shortmess:append({ c = true, I = true })

-- Searching
opt.ignorecase = true
opt.smartcase = true
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Scrolling
-- opt.scrolloff = 4
-- opt.sidescrolloff = 8

-- Windows
opt.splitbelow = true
opt.splitright = true

-- Spaces & Tabs
local INDENT = 4

opt.expandtab = false
opt.shiftround = true
opt.shiftwidth = INDENT
opt.tabstop = INDENT
opt.smartindent = true

