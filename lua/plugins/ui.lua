return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- recommended for icons
      "MunifTanjim/nui.nvim",
    },

    config = function()
      local neotree = require("neo-tree")

      -- Basic setup
      neotree.setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        default_component_configs = {
          indent = { padding = 1 },
          icon = { folder_closed = "", folder_open = "" },
        },
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
          },
          follow_current_file = true,
          window = {
            position = "right", -- <-- RIGHT SIDE
            width = 20,
          },
        },
      })

      -- Keymap to toggle Neo-tree
      vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem<CR>", { noremap = true, silent = true })
    end,
  },

  -- lualine
  -- thats the bottom ui coponent that shows some current status
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },
}
