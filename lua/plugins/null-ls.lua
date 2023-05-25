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

			nls.setup({
				sources = {
					formatting.prettier.with(prettier_conf()),
					formatting.shfmt.with(shfmt_conf()),
					code_actions.gitsigns,
					require('typescript.extensions.null-ls.code-actions'),

				},
				update_in_insert = false
			})
			mnls.setup({
				ensure_installed = { 'prettier', 'shfmt' },
				automatic_setup = true,
				handlers = {}
			})
		end,
	},
}
