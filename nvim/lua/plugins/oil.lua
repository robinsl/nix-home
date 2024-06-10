return {
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  {
    "stevearc/oil.nvim",

    cmd = { "Oil" },
    event = { "VimEnter */*,.*", "BufNew */*,.*" },
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you still want to use netrw.
      default_file_explorer = true,

      keymaps = {},
    },
  },
}
