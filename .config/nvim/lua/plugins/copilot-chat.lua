-- Override LazyVim's copilot-chat extra with improved keymaps:
-- - Agent mode (tools = 'copilot') enables the `edit` tool so diffs apply directly
-- - buffer:active as sticky ensures the current buffer is always in context
-- - Model switching via select_model() or inline $model-name in prompts
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function(_, opts)
      -- Keep buffer content in context for every message (sticky = remembered across prompts)
      opts.sticky = { "#buffer:active" }
      -- Use block diff format (cleaner for the edit tool)
      opts.diff = "block"
    end,
    keys = {
      -- Override <leader>aq: Quick inline edit — agent mode applies changes directly to the file
      {
        "<leader>aq",
        function()
          vim.ui.input({ prompt = "Quick Edit: " }, function(input)
            if input and input ~= "" then
              require("CopilotChat").ask(input, {
                tools = "copilot", -- enables the edit tool (agent mode)
                resources = "buffer:active",
                window = {
                  layout = "float",
                  relative = "cursor",
                  width = 0.6,
                  height = 0.4,
                  border = "rounded",
                },
              })
            end
          end)
        end,
        desc = "Quick Edit (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>aa: Full chat — sticky buffer context already set globally via opts.sticky
      {
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Chat (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>ae: Explain selection
      {
        "<leader>ae",
        function()
          require("CopilotChat").ask("Explain", {
            selection = require("CopilotChat.select").visual,
          })
        end,
        desc = "Explain Selection (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>af: Fix — agent mode applies the fix directly
      {
        "<leader>af",
        function()
          require("CopilotChat").ask(
            "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.",
            {
              tools = "copilot", -- apply fix directly via edit tool
              resources = "buffer:active",
            }
          )
        end,
        desc = "Fix (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>am: Model selector
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "Select Model (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>ap: Prompt picker (kept from LazyVim default)
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "x" },
      },

      -- <leader>ax: Clear chat (kept from LazyVim default)
      {
        "<leader>ax",
        function()
          require("CopilotChat").reset()
        end,
        desc = "Clear Chat (CopilotChat)",
        mode = { "n", "x" },
      },
    },
  },
}
