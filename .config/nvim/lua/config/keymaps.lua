-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap({ "n", "i", "v" }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all files" })

keymap("n", "<leader>oc", function()
  local cwd = vim.fn.getcwd()
  vim.fn.jobstart({ "alacritty", "--working-directory", cwd, "-e", "opencode" }, { detach = true })
end, { desc = "Open OpenCode in new Alacritty window" })

-- Replace all the words under the cursor

-- Move selected lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

keymap("n", "J", "mzJ`z", { desc = "Join lines without moving the cursor" })

-- Keep the cursor in the middel of the screen
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center the cursor" })
keymap("n", "<C-b>", "<C-b>zz", { desc = "Sroll up and center de cursor" })

-- Keep the search terms in the middle of the screen
keymap("n", "n", "nzzzv", { desc = "Go to the next search result and center the cursor" })
keymap("n", "N", "Nzzzv", { desc = "Go to the previous search result and center the cursor" })

-- Paste without overwriting the default register
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting the default register" })

-- Replace word under cursor globally in this file
keymap("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "Replace word under cursor globally" })
