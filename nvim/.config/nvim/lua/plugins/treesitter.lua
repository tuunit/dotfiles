return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "go", "lua", "bash", "json", "markdown", "markdown_inline" })
    end,
  },
}
