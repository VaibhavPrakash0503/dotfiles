require "nvchad.mappings"

-- add yours here

-- Open compiler
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F5>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Stop the dispose all task 
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>CompilerStop<cr>", { noremap = true, silent = true })

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
