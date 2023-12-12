return {
	'declancm/maximize.nvim',
	opts = {},
	keys = {
		{ '<leader>m', function() require('maximize').toggle() end, desc = 'Maximize: maximize or restore buffer' },
	},
}
