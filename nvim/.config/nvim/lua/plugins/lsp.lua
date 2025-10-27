return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Configure Ruff for linting and formatting
        ruff = {
          init_options = {
            settings = {
              -- Any extra CLI arguments for ruff
              args = {},
            },
          },
        },
        -- Configure Pyright for type checking and hover
        pyright = {
          settings = {
            pyright = {
              -- Disable organize imports (Ruff handles this)
              disableOrganizeImports = true,
              disableTaggedHints = true,
            },
            python = {
              analysis = {
                -- Type checking mode
                typeCheckingMode = "basic", -- or "standard" for stricter
                -- Use library code for better completions
                useLibraryCodeForTypes = true,
                -- Disable diagnostics to avoid duplicates with Ruff
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
      init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "ruff" then
              -- Disable Ruff's hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end,
        })
      end,
    },
  },
}
