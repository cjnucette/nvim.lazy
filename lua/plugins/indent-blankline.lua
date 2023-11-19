return {
	'lukas-reineke/indent-blankline.nvim',
	event = { 'BufRead', 'BufNewFile' },
	main = 'ibl',
	enabled = false,
	opts = {
		-- enabled = true,
		exclude = {
			filetypes = { 'neo-tree', 'lazy', 'mason' },
		},
	},
}
