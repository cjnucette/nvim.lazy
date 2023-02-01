return {
	'kevinhwang91/nvim-ufo',
	dependencies = {
		'kevinhwang91/promise-async',
	},
	config = function()
		local map = require('utils').map

		vim.opt.foldcolumn = '0'
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.opt.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldsep = ' ', foldclose = '' }

		map('n', '<space><space>', 'za', { desc = 'Unfold all' })
		map('n', 'zR', require('ufo').openAllFolds)
		map('n', 'zM', require('ufo').closeAllFolds)
		-- map('n', 'K', function()
		-- 	local winid = require('ufo').peekFoldedLinesUnderCursor()
		-- 	if not winid then vim.lsp.buf.hover() end
		-- end)

		require('ufo').setup({
			provider_selector = function(_bufnr, _filetype, _buftype)
				return { 'treesitter', 'indent' }
			end
		})
	end
}
