local M = {
	'princejoogie/chafa.nvim',
	cmd = 'ViewImage',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'm00qek/baleia.nvim'
	}
}

M.opts = {
	render = {
		min_padding = 5,
		show_label = true,
	},
	events = {
		update_on_nvim_resize = true
	}
}

return M
