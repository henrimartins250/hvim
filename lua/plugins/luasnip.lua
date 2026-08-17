return {
  {
    "L3MON4D3/LuaSnip",
    version = false,
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      region_check_events = "CursorMoved",
      delete_check_events = "TextChangedI",
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      -- Load VS Code-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  -- Keep friendly-snippets (already installed)
  { "rafamadriz/friendly-snippets" },
}
