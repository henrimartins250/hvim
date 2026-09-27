return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      -- detect *.wgsl files
      vim.filetype.add({ extension = { wgsl = "wgsl" } })

      -- register the third-party wgsl parser so :TSInstall wgsl knows where to get it
      -- (this is the API used by the nvim-treesitter "main" branch)
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").wgsl = {
            install_info = {
              url = "https://github.com/szebniok/tree-sitter-wgsl",
              branch = "master", -- repo default branch (installer assumes "main")
              queries = "queries", -- also installs the repo's highlights.scm and folds.scm
            },
          }
        end,
      })
    end,
    -- NOTE: must be nested in opts, and LazyVim list-extends these with its defaults
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "sql",
        "javascript",
        "json",
        "lua",
        "julia",
        "dart",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "nix",
        "typescript",
        "vim",
        "yaml",
        "wgsl",
      },
    },
  },
}
