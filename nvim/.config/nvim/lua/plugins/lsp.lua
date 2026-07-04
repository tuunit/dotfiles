return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(client, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", "[G]oto [D]efinition new tab")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        nmap("gp", vim.diagnostic.goto_prev, "[G]oto [p]rev")
        nmap("gn", vim.diagnostic.goto_next, "[G]oto [n]ext")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>rt", vim.lsp.buf.rename, "[R]ename [T]ype")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]oc [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]space [S]ymbols")
        nmap("K", vim.lsp.buf.hover, "Hover Docs")
        nmap("<C-K>", vim.lsp.buf.signature_help, "Signature Docs")

        -- autoformat on write
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            local mode = vim.api.nvim_get_mode().mode
            if vim.bo.modified and mode == "n" then
              vim.lsp.buf.format()
            end
          end,
        })

        -- disable formatting once
        vim.api.nvim_create_user_command("NoFormat", function()
          vim.cmd("noautocmd write")
        end, {})
      end)

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "gopls" },
        handlers = {
          lsp_zero.default_setup,
        },
      })
    end,
  },
}
