return {

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- 1. Keep your list of extra parsers and add "wgsl" to it
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

      -- 2. Register the WGSL filetype extension
      vim.filetype.add({ extension = { wgsl = "wgsl" } })

      -- 3. Define the custom repository for the wgsl parser
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.wgsl = {
        install_info = {
          url = "https://github.com",
          files = { "src/parser.c" },
        },
      }

      -- 4. Apply your custom folding rules automatically when opening a wgsl file
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "wgsl",
        callback = function()
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
          vim.o.foldlevelstart = 99
        end,
      })
    end,
  },
}
