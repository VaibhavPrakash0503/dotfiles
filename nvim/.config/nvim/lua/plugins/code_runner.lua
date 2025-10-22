return {
  "CRAG666/code_runner.nvim",
  keys = {
    { "<leader>r", "<cmd>RunCode<CR>", desc = "Run Code" },
    { "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
    { "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
    { "<leader>rc", "<cmd>RunClose<CR>", desc = "Close Runner" },
    { "<leader>crf", "<cmd>CRFiletype<CR>", desc = "Code Runner Filetype" },
    { "<leader>crp", "<cmd>CRProjects<CR>", desc = "Code Runner Projects" },
  },
  opts = {
    mode = "float", -- Options: "term", "float", "tab", "toggleterm"
    focus = true,
    startinsert = true,
    term = {
      position = "bot", -- Position: "bot", "top", "vert"
      size = 15,
    },
    float = {
      border = "rounded",
      height = 0.8,
      width = 0.8,
    },
    filetype = {
      -- Java
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },

      -- C
      c = {
        "cd $dir &&",
        "gcc $fileName -o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
      },

      -- C++
      cpp = {
        "cd $dir &&",
        "g++ $fileName -o /tmp/$fileNameWithoutExt &&",
        "/tmp/$fileNameWithoutExt",
      },

      -- Python
      python = "python3 -u $fileName",

      -- JavaScript
      javascript = "node $fileName",

      -- TypeScript
      typescript = "ts-node $fileName",

      -- Rust
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },

      -- Go
      go = "go run $fileName",
    },
  },
}
