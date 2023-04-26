return {
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		-- enabled = false,
		dependencies = {
			'jose-elias-alvarez/typescript.nvim',
			'jay-babu/mason-null-ls.nvim',
		},
		config = function()
			local nls = require('null-ls')
			local mnls = require('mason-null-ls')

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
			local diagnostics = nls.builtins.diagnostics

			nls.setup({
				sources = {
					formatting.prettier.with(prettier_conf()),
					formatting.shfmt.with(shfmt_conf()),
					diagnostics.proselint,
					diagnostics.write_good,
					diagnostics.alex,
					code_actions.gitsigns,
					code_actions.proselint,
					require('typescript.extensions.null-ls.code-actions'),

				},
				update_in_insert = false
			})
			mnls.setup({
				ensure_installed = { 'prettier', 'shfmt', 'alex', 'proselint', 'write-good' },
				automatic_setup = true,
				handlers = {}
			})
		end,
	},
}
