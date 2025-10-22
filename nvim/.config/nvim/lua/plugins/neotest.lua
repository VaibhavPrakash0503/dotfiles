return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Language adapters
    "nvim-neotest/neotest-python", -- Python (pytest/unittest)
    "nvim-neotest/neotest-jest", -- JavaScript/TypeScript (Jest)
    "rcasia/neotest-java", -- Java (JUnit/Maven/Gradle)
    "orjangj/neotest-ctest", -- C/C++ (CTest/GoogleTest)
  },
  opts = {
    adapters = {
      -- Python configuration
      ["neotest-python"] = {
        dap = { justMyCode = false },
        runner = "pytest", -- or "unittest"
        args = { "--log-level", "DEBUG", "-v" },
      },

      -- JavaScript/TypeScript configuration
      ["neotest-jest"] = {
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.js",
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },

      -- Java configuration
      ["neotest-java"] = {
        -- Automatically detects Maven/Gradle
        -- No extra config needed
      },

      -- C/C++ configuration
      ["neotest-ctest"] = {
        -- Requires CMake with enable_testing()
      },
    },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        vim.cmd("copen")
      end,
    },
  },
}
