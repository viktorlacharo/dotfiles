-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-save on focus lost, insert leave, or text change
vim.api.nvim_create_autocmd({ "FocusLost", "InsertLeave", "TextChanged" }, {
  callback = function()
    -- Only save if buffer is modified and is a real file
    if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" and not vim.bo.readonly then
      vim.cmd("silent! write")
    end
  end,
})
