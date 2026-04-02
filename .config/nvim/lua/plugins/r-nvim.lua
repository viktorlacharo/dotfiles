return {
  {
    "R-nvim/R.nvim",
    opts = {
      -- Use radian as the R console (better REPL with syntax highlighting)
      R_app = "radian",
      R_cmd = "radian",
      R_args = {},
      -- Use httpgd for plots (opens in browser, live-updating)
      -- httpgd starts automatically when you call hgd() in R
      -- R.nvim will open the plot URL in your browser
      open_html = "open",
      -- Start R automatically when opening .R files
      auto_start = "on load",
      -- Assign <- with a single underscore key press (like RStudio)
      assign_map = "<M-->",
      -- Show R object list in a side panel (like RStudio's Environment pane)
      objbr_auto_start = false,
    },
  },
}
