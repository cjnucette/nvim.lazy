return {
	{
		'jcdickinson/http.nvim',
		build = 'cargo build --workspace --release',
		enabled = false,
	},
	{
		'jcdickinson/codeium.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim'
		},
		config = true,
		enabled = false,
	}
}
