local M = {
	'uga-rosa/ccc.nvim',
	event = 'BufReadPre',
}
M.config = function()
	require('ccc').setup({
		highlighter = {
			auto_enable = true,
			excludes = { 'help', 'lazy' }
		}
	})

	require('user.utils').map('n', '<leader>cp', vim.cmd.CccPick,
	                          { desc = 'CCC: Detects a replaces the color under the cursor' })
	require('user.utils').map('n', '<leader>cc', vim.cmd.CccConvert,
	                          { desc = 'CCC: Convert color formats directly without opening the UI' })
end

return M
