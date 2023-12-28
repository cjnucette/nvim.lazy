return {
	{
		-- 'jose-elias-alvarez/null-ls.nvim',
		'nvimtools/none-ls.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		-- enabled = false,
		config = function()
			local nls = require('null-ls')

			local prettier_conf = function()
				local options = {
					filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'markdown',
						'markdown.mdx' },
					extra_args = {
						'--config-precedence',
						'prefer-file',
						'--single-quote',
						'true',
						'--bracket-same-line',
						'false',
						'--trailing-comma',
						'es5',
						'--tab-width',
						'4',
						'--use-tabs',
						'true',
						'--print-width',
						'120',
					}
				}

				return options
			end

			local shfmt_conf = function()
				local options = {
					extra_args = {
						'-i', '4', '-ci'
					}
				}
				return options
			end

			local formatting = nls.builtins.formatting
			local code_actions = nls.builtins.code_actions

			nls.setup({
				sources = {
					formatting.prettier.with(prettier_conf()),
					formatting.shfmt.with(shfmt_conf()),
					code_actions.gitsigns,
				},
				update_in_insert = false
			})
		end,

		keys = {
			{
				'<leader>f',
				vim.lsp.buf.format,
				mode = { 'n', 'v' },
				desc = 'None-ls: [F]ormat buffer'
			},
			{
				'<leader>fs',
				function()
					vim.lsp.buf.format()
					vim.cmd.w()
				end,
				mode = { 'n', 'v' },
				desc = 'None-ls: [F]ormat and [S]ave buffer'
			}
		},
	},
}
