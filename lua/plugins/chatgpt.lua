return {
	{
		'jackMort/ChatGPT.nvim',
		enabled = false,
		event = 'VeryLazy',
		dependencies = {
			'MunifTanjim/nui.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim'
		},
		opts = {
			-- depends on pass command
			-- api_key_cmd="pass show api/tokens/openai"
		},
	}
}
