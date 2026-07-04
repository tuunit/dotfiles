return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort = { sorter = "case_sensitive" },
        view = { width = 30 },
        renderer = { group_empty = true },
        filters = { dotfiles = true },
        update_focused_file = { enable = true },
        on_attach = function(bufnr)
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          local ok, api = pcall(require, "nvim-tree.api")
          assert(ok, "api module is not found")

          local function edit_or_open()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
              -- expand or collapse folder
              api.node.open.edit()
            else
              -- open file
              api.node.open.edit()
              -- Close the tree if file was opened
              api.tree.close()
            end
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          vim.keymap.set("n", "<CR>", edit_or_open, opts("Edit or Open"))
        end,
      })
    end,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", silent = true, noremap = true },
    },
  },
}
