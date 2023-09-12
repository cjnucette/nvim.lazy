return {
	'roobert/activate.nvim',
	keys = {
		{
			'<leader>a',
			'<cmd>lua require("activate").list_plugins()<cr>',
			desc = "[activate] List plugins"
		}
	}
}
