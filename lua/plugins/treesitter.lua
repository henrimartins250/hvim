return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
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
      },
    },
  },
}
