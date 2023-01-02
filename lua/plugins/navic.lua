local M = {
	'SmiteshP/nvim-navic'
}

function M.config()
	require('nvim-navic').setup({
	highlight = true,
	separator = ' 〉',
	depth_limit = 5
	})
end

return M
