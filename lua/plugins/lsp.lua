return {

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        qmlls = {
          mason = false,
          filetypes = { "qml" },
          -- Ensure it grabs the environment variables set by your shell/home.nix
          on_new_config = function(new_config, _)
            new_config.cmd_env = vim.empty_dict()
          end,
          on_attach = function(client, bufnr)
            vim.diagnostic.config({
              virtual_text = {
                severity = {
                  min = vim.diagnostic.severity.ERROR,
                },
              },
              signs = {
                severity = {
                  min = vim.diagnostic.severity.ERROR,
                },
              },
              underline = {
                severity = {
                  min = vim.diagnostic.severity.ERROR,
                },
              },
            }, { bufnr = bufnr })
          end,
        },
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
}
