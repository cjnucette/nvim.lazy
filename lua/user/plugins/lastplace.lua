local M = {
	'ethanholz/nvim-lastplace',
	event = 'BufReadPre'
}

function M.config()
	require('nvim-lastplace').setup()
end

return M
