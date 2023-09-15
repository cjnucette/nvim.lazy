return {
	{
		'nvimdev/guard.nvim',
		event = { 'BufReadPre', 'BufNewFile' },
		enabled = false,
		init = function()
			local gft = require('guard.filetype')

			local shfmt = {
				cmd = 'shfmt',
				args = { '-i', '4', '-ci' },
				stdin = true,
			}
			local prettier = {
				cmd = 'prettier',
				args = {
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
				},
				stdin = true,
			}

			gft('html'):fmt(prettier)
			gft('css'):fmt(prettier)
			gft('javascript'):fmt(prettier)
			gft('javascriptreact'):fmt(prettier)
			gft('typescript'):fmt(prettier)
			gft('typescriptreact'):fmt(prettier)
			gft('markdown'):fmt(prettier)
			gft('json'):fmt(prettier)
			gft('bash'):fmt(shfmt)
			gft('sh'):fmt(shfmt)
		end,
		opts = {
			format_on_save = true,
			lsp_as_default_formatter = true
		},
		keys = {
			{ '<leader>f', '<cmd>GuardFmt<cr>', { desc = 'Guard: [F]ormat' } }
		}
	},
}
