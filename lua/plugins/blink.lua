return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-Space>"] = { "show", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<C-e>"] = { "hide" },
      },
    },
  },
}
