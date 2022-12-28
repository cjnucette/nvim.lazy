local M = {
	'windwp/nvim-autopairs',
	event = 'BufReadPre'
}

function M.config()
	require('nvim-autopairs').setup({
		check_ts = true
	})
end

return M
