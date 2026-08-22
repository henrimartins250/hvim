return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local extra_parsers = {
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
        "wgsl", -- Added wgsl here
      }

      -- Merge your list safely into LazyVim's default parsers
      if type(opts.ensure_installed) == "table" then
        for _, parser in ipairs(extra_parsers) do
          if not vim.tbl_contains(opts.ensure_installed, parser) then
            table.insert(opts.ensure_installed, parser)
          end
        end
      else
        opts.ensure_installed = extra_parsers
      end

      -- Register the WGSL filetype extension
      vim.filetype.add({ extension = { wgsl = "wgsl" } })

      -- Define the custom repository for the wgsl parser
      -- (nvim-treesitter main branch requires registering parsers on TSUpdate)
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").wgsl = {
            install_info = {
              url = "https://github.com/szebniok/tree-sitter-wgsl",
              queries = "queries", -- ships highlights.scm and folds.scm
            },
          }
        end,
      })

      -- Apply your custom folding rules automatically when opening a wgsl file
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "wgsl",
        callback = function()
          vim.opt_local.foldmethod = "expr"
          vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.opt_local.foldlevelstart = 99
        end,
      })
    end,
  },
}
