return {
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000, -- load before other UI plugins
    config = function()
      require("monokai-pro").setup({
        filter = "octagon",
      })
      require("monokai-pro").load()
    end,
  },
}
