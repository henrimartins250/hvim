return {

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {

        -- qml language server
        qmlls = {
          mason = false,
          filetypes = { "qml" },
          -- Ensure it grabs the environment variables set by your shell/home.nix
          on_new_config = function(new_config, _)
            new_config.cmd_env = vim.empty_dict()
          end,
        },

        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        -- Rust
        rust_analyzer = {
          mason = false,
        },

        wgsl_analyzer = {
          mason = false,
        },

        -- C / C++
        clangd = {
          mason = false,
        },

        -- TypeScript / JavaScript
        ts_ls = {

          mason = false,
        },

        -- HTML / CSS / JSON
        html = {},
        cssls = {},
        jsonls = {},

        -- Lua
        lua_ls = {

          mason = false,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },

        -- Nix
        nil_ls = {

          mason = false,
        },
        -- nixd = {}, -- use this instead if you prefer nixd

        -- Sql
        sqls = {
          mason = false,
        },

        -- Bash
        bashls = {},

        -- YAML
        yamlls = {},

        -- TOML
        taplo = {},

        -- Markdown
        marksman = {
          mason = false,
        },
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
}
