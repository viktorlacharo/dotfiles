-- Error Lens style inline diagnostics
-- Replaces the default virtual_text with styled inline messages per line
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    opts = {
      preset = "modern", -- modern | classic | minimal | powerline | ghost | simple | nonerdfont | amongst
      hi = {
        error = "DiagnosticError",
        warn = "DiagnosticWarn",
        info = "DiagnosticInfo",
        hint = "DiagnosticHint",
        arrow = "NonText",
        background = "CursorLine",
        mixing_color = "None",
      },
      options = {
        -- Show source (e.g. "eslint", "clangd") in the message
        show_source = true,
        -- Show error code (e.g. E0001)
        show_codes = true,
        -- How many lines to show when a diagnostic spans multiple lines
        multilines = {
          enabled = true,
          always_show = false,
        },
        -- Show all diagnostics on the line, not just the most severe
        multiple_diag_under_cursor = true,
        -- Show diagnostic on all lines or just the cursor line
        show_all_diags_on_cursorline = false,
        -- Enable in insert mode
        enable_on_insert = false,
        overflow = {
          mode = "wrap", -- wrap | none | oneline
        },
        -- Throttle refresh in ms (0 = instant)
        throttle = 20,
        softwrap = 15,
        -- Show related diagnostic info (e.g. "defined here")
        virt_texts = {
          priority = 2048,
        },
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      -- Disable default virtual_text since tiny-inline-diagnostic replaces it
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
