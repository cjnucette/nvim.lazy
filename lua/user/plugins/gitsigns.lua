local M = {
	'lewis6991/gitsigns.nvim',
	dependencies = {
		'tpope/vim-fugitive'
	},
	event = 'BufReadPre'
}

function M.config()
	require('gitsigns').setup()
end

return M
