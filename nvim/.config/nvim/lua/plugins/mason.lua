return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup()
    
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "pyright",
      },
    })

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {}
      end,
    }
  end,
}

