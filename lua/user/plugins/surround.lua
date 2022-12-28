local M = {
	'kylechui/nvim-surround',
	version = '*',
	event = 'InsertEnter'
}

function M.config()
	require('nvim-surround').setup()
end

return M
