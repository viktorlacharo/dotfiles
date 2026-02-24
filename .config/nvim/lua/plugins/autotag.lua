return {
  {
    -- Plugin: nvim-ts-autotag
    -- Description: Automatically closes and renames HTML/JSX tags using Treesitter.
    -- Event: Loads on InsertEnter for performance.
    -- Options: Uses default options.
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },
}
