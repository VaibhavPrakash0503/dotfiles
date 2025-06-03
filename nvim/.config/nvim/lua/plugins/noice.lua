return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { icon = "", lang = "vim" },
        },
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      messages = {
        enabled = true,
        view = "mini",
      },
      presets = {
        command_palette = true,
        lsp_doc_border = true,
      },
    })

    vim.notify = require("notify")
  end,
}

