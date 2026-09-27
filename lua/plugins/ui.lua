return {

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
            ▄▄▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄     
            █     █░    █ █     █     █ █     █ ▓         ▀▀▄  
            █     █▒    █ █     █     ░ ▓     █ ▒            █ 
            █     ░░    █ ░     █     ▒ ▀▀▀▀▀▀▀ ░            ▐▌
            ░           █ ▒     █     ▓ █     ░ █    ▓   ▓    ▒
            ▒     ░░    ░ ▓     █     █ ░     ▒ ░    ░   ░    ▓
            ▓     ▒▒    ▒ ▀▄         ▄▀ ▒     ▓ ▒    ▒   ▒    █
            █     ▓░    ▓   ▀▄     ▄▀   ▓     █ ▓    ▓▀▀▀▓    █
            █     █     █     ▀▄ ▄▀     █     █ █    █   █    █
            ▀▀▀▀▀ ▀▀▀▀▀▀▀       ▀       ▀▀▀▀▀▀▀ ▀▀▀▀▀▀   ▀▀▀▀▀▀          
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },

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
