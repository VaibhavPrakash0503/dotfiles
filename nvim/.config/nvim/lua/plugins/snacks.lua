return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- Explorer picker configuration
      hidden = true, -- show hidden files (dotfiles)
      ignored = true, -- show files normally ignored by git
      -- Optionally exclude specific directories (e.g., .git or node_modules)
      -- exclude = { ".git", "node_modules" },
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { ".git", ".jj" },
        },
      },
    },
  },
}
