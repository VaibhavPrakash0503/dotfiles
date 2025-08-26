return {
  "andweeb/presence.nvim",
  config = function()
    require("presence").setup({
      -- General
      auto_update = true,
      main_image = "file", -- show file icons like VS Code
      neovim_image_text = "Neovim IDE",
      show_time = true, -- show elapsed editing time
      enable_line_number = false, -- VS Code style (no line numbers)
      buttons = false, -- no buttons like "View Repo"

      -- Rich Presence text
      editing_text = "Editing %s", -- filename
      reading_text = "Reading %s",
      workspace_text = "Working on %s", -- project/repo
      file_explorer_text = "Browsing %s",
    })
  end,
}
