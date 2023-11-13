return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufRead', 'BufNewFile' },
	main = 'ibl',
	opts = {
		enabled = true,
		exclude = {
			filetypes = { 'neo-tree', 'lazy', 'mason' },
		},
	},
}
