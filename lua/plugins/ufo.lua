return {
	{
		'kevinhwang91/nvim-ufo',
		dependencies = {
			'kevinhwang91/promise-async',
			'luukvbaal/statuscol.nvim'
		},
		config = function()
			local map = require('utils').map

			vim.opt.foldcolumn = '1'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
			vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })

			map('n', '<space><space>', 'za', { desc = 'Unfold all' })
			map('n', 'zR', require('ufo').openAllFolds)
			map('n', 'zM', require('ufo').closeAllFolds)
			map('n', 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end)

			require('ufo').setup({
				provider_selector = function(_, _, _)
					return { 'treesitter', 'indent' }
				end
			})
		end
	},
	{
		'luukvbaal/statuscol.nvim',
		config = function()
			require('statuscol').setup({
				setopt = true,
				foldfunc = 'builtin'
			})
		end
	}
}
