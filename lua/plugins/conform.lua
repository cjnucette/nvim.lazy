return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			html = {'prettier'},
			astro = {'prettier'},
			json = {'prettier'},
			javascript = {'prettier'},
			typescript = {'prettier'},
			javascriptreact = {'prettier'},
			typescriptreact = {'prettier'},
			sh = {'shfmt'}
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		-- format_after_save = {
		-- 	lsp_fallback = true,
		-- }
	}
}
