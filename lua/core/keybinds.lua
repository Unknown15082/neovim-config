-- Unmap <Space>
vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })

-- Set <leader> to <Space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save with <C-s>
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<Esc><Cmd>w<CR>a")

