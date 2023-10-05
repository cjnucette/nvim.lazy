-- Use your favorite package manager to install, for example in lazy.nvim
return {
	{
		'sourcegraph/sg.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		lazy = false,
		keys = {
			{
				'<leader>ss',
				function() require('sg.extensions.telescope').fuzzy_search_results() end,
				desc = 'SG: Search with telescope'
			},
		}
	},
}
