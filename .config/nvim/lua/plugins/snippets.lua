return {
  {
    "garymjr/nvim-snippets",
    opts = function(_, opts)
      opts.search_paths = opts.search_paths or {}
      table.insert(opts.search_paths, vim.fn.stdpath("config") .. "/snippets")
    end,
  },
}
