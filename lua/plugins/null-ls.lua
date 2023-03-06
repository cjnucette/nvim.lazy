local M = {
	'jose-elias-alvarez/null-ls.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
	-- enabled = false,
	dependencies = {
		'jose-elias-alvarez/typescript.nvim',
	}
}

function M.config()
	local nullls = require('null-ls')

	local prettier_conf = function()
		local options = {
			filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'markdown', 'markdown.mdx' },
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

	local formatting = nullls.builtins.formatting
	local code_actions = nullls.builtins.code_actions

	nullls.setup({
		sources = {
			formatting.prettier.with(prettier_conf()),
			formatting.shfmt.with(shfmt_conf()),
			code_actions.gitsigns,
			require('typescript.extensions.null-ls.code-actions'),
		},
		update_in_insert = false
	})
end

return M
