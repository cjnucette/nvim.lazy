local M = {
	'uga-rosa/ccc.nvim',
	event = { 'BufReadPre', 'BufNewFile' },
}
M.config = function()
	require('ccc').setup({
		highlighter = {
			auto_enable = true,
			excludes = { 'help', 'lazy' },
			lsp = true,
		}
	})

	require('utils').map('n', '<leader>cp', vim.cmd.CccPick,
		{ desc = 'CCC: Detects a replaces the color under the cursor' })
	require('utils').map('n', '<leader>cc', vim.cmd.CccConvert,
		{ desc = 'CCC: Convert color formats directly without opening the UI' })
end

return M
