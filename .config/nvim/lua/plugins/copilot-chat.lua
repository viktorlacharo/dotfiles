return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      -- <leader>am: Model selector
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "Select Model (CopilotChat)",
        mode = { "n", "x" },
      },
    },
  },
}
