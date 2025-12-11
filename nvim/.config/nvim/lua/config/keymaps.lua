-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Makes jj to escape to normal mode
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
vim.api.nvim_set_keymap("n", "<leader>lp", ":LivePreview start<CR>", { desc = "Start Live Preview" })
vim.api.nvim_set_keymap("n", "<leader>ls", ":LivePreview close<CR>", { desc = "Stop Live Preview" })
