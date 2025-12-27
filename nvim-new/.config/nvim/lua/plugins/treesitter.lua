return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "go", "lua", "bash", "json" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
}
