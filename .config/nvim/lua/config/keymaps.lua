-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

keymap({ "n", "i", "v" }, "<C-s>", "<cmd>wa<CR>", { desc = "Save all files" })

keymap("n", "<leader>oc", function()
  local cwd = vim.fn.getcwd()
  vim.fn.jobstart({ "alacritty", "--working-directory", cwd, "-e", "opencode" }, { detach = true })
end, { desc = "Open OpenCode in new Alacritty window" })
