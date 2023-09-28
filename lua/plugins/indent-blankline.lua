return  {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufRead', 'BufNewFile' },
	main = 'ibl',
	opts = {
		exclude = {
			filetypes = { 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
		},
	},
}
