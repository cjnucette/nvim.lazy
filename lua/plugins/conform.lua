return {
	'stevearc/conform.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		formatters_by_ft = {
			html = { 'prettier' },
			css = { 'prettier' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			javascriptreact = { 'prettier' },
			typescriptreact = { 'prettier' },
			astro = { 'prettier' },
			json = { 'prettier' },
			sh = { 'shfmt' }
		},
		-- creates autocomd to format on save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
			async = false,
		},
	},
	keys = {
		{
			'<leader>f',
			function()
				require('conform').format({
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				})
			end,
			mode = { 'n', 'v' },
			desc = 'Conform: [F]ormat buffer'
		},
		{
			'<leader>fs',
			function()
				require('conform').format({
					timeout_ms = 500,
					lsp_fallback = true,
					async = false,
				})
				vim.cmd.w()
			end,
			mode = { 'n', 'v' },
			desc = 'Conform: [F]ormat and [S]ave buffer'
		}
	},
}
