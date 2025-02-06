-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true

local opt = vim.opt
vim.opt.clipboard = "unnamed"
vim.opt.number = true
vim.opt.mouse = "a"

vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.magic = true

vim.opt.splitright = true
vim.opt.splitbelow = true
