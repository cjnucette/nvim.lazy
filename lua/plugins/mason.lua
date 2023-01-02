local M = {
	'williamboman/mason.nvim',
	event = 'VimEnter'
}

function M.config()
	require('mason').setup({
		ui = { border = 'rounded' },
		install_root_dir = vim.fn.stdpath('config') .. '/mason'
	})
end

return M
