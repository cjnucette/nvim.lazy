return {
	{
		'kevinhwang91/nvim-ufo',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'kevinhwang91/promise-async',
			'luukvbaal/statuscol.nvim'
		},
		keys = {
			{ '<space><space>', 'za', { desc = 'UFO: toggle fold' } },
			{ 'zR', require('ufo').openAllFolds, { desc = 'UFO: unfold all' } },
			{ 'zM', require('ufo').closeAllFolds, { desc = 'UFO: close all folds' } },
			{ 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end,
				{ desc = 'UFO: Peek folded lines under the cursor' } },
		},
		config = function()
			vim.opt.foldcolumn = '1'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
			vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })

			require('ufo').setup({
				provider_selector = function(_, _, _)
					return { 'treesitter', 'indent' }
				end
			})
		end
	},
	{
		'luukvbaal/statuscol.nvim',
		opts = function()
			local builtin = require('statuscol.builtin')
			return {
				relculright = true,
				segments = {
					{ text = { '%s' }, click = 'v:lua.ScSa' },
					{ text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
					{ text = { ' ', builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
				}
			}
		end
	}
}
