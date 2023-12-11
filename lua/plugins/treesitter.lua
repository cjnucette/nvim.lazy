return {
	{
		'nvim-treesitter/nvim-treesitter',
		version = false,
		build = ':TSUpdate',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'windwp/nvim-ts-autotag',
		},
		keys = {
			{ '<C-space>', desc = 'Treesitter: Increment selection' },
			{ '<bs>', desc = 'Treesitter: Decrement selection', mode = 'x' },
			{ '<C-s>', desc = 'Treesitter: Increment selection by scope' },
		},
		config = function()
			require('nvim-treesitter.configs').setup {
				highlight = { enable = true },
				indent = { enable = true },
				sync_install = false,
				modules = {},
				ignore_install = {},
				auto_install = true,
				ensure_installed = { 'lua', 'vim' },
				autotag = { enable = true },
			}
		end
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		config = true,
	}
}
