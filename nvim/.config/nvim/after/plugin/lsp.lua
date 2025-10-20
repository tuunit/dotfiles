local lsp_zero = require('lsp-zero')

lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end


	--Show description of symbol

	nmap("gd", vim.lsp.buf.definition, '[G]oto [D]efinition')
	nmap("gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", '[G]oto [D]efinition in new tab')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
	nmap('gp', vim.diagnostic.goto_prev, '[G]oto [p]revious diagnostics')
	nmap('gn', vim.diagnostic.goto_next, '[G]oto [n]ext diagnostics')
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
	nmap('<leader>rt', vim.lsp.buf.rename, '[R]ename [T]ype')
	nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
	nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	nmap('<C-K>', vim.lsp.buf.signature_help, 'Singature Documentation')

	-- vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
	-- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	-- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	-- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	-- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	-- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	-- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

	-- Autoformat
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			local mode = vim.api.nvim_get_mode().mode
			if vim.bo.modified == true and mode == 'n' then
				vim.lsp.buf.format()
			end
		end
	})

	-- Write file without autoformatting :NoFormat
	vim.api.nvim_create_user_command('NoFormat', function()
		vim.cmd('noautocmd write')
	end, {})
end)

require('mason').setup()

require('mason-lspconfig').setup({
	ensure_installed = {
		'bashls',
		'lua_ls',
		'vimls',
		'gopls',
		'golangci_lint_ls',
		'jqls',
		'marksman',
		'yamlls',
		'dockerls',
		'terraformls'
	}
})

vim.lsp.config('bashls', {})
vim.lsp.config('vimls', {})
vim.lsp.config('gopls', {})
vim.lsp.config('golangci_lint_ls', {})
vim.lsp.config('jqls', {})
vim.lsp.config('marksman', {})
vim.lsp.config('dockerls', {})
vim.lsp.config('terraformls', {})
vim.lsp.config('lua_ls', lsp_zero.nvim_lua_ls())
vim.lsp.config('yamlls', {
	settings = {
		yaml = {
			format = {
				enable = true,
				singleQuote = false,
				bracketSpacing = true
			},
			validate = true,
			completion = true
		}
	}
})

local cmp = require('cmp')

cmp.setup({
	sources = {
		{ name = 'path' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip', keyword_length = 2 },
		{ name = 'buffer',  keyword_length = 3 },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<Esc>'] = cmp.mapping.abort(),
	}),
})
