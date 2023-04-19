local M = {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufRead',
}

function M.config()
	require('indent_blankline').setup({
		filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
		show_current_context = false,
		show_current_context_start = false,
	})
end

return M
