-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Compiler plugin keymaps
vim.keymap.set("n", "<F5>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F6>", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
