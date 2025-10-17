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
      setup = {
        -- Disable Ruff's hover in favor of Pyright
        ruff = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff" then
              client.server_capabilities.hoverProvider = false
            end
          end, "ruff")
        end,
      },
    },
  },
}
