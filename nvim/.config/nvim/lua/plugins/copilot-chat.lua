return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    model = "claude-sonnet-4.5",
    show_models = true,
    temperature = 0.1,

    prompts = {
      Explain = {
        prompt = "Write an explanation for the selected code as paragraphs of text.",
      },
      Review = {
        prompt = "Review the selected code.",
      },
      Fix = {
        prompt = "There is a problem in this code. Rewrite the code to show it with the bug fixed.",
      },
      Optimize = {
        prompt = "Optimize the selected code to improve performance and readability.",
      },
      Tests = {
        prompt = "Please generate tests for the selected code.",
      },
      Docs = {
        prompt = "Please add documentation comments for the selected code.",
      },
    },

    mappings = {
      complete = {
        detail = "Use @<Tab> or /<Tab> for options.",
        insert = "<Tab>",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-l>",
        insert = "<C-l>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
      yank_diff = {
        normal = "gy",
        register = '"',
      },
      show_info = {
        normal = "gi",
      },
    },

    auto_insert_mode = true,
    show_help = true,
  },
}
