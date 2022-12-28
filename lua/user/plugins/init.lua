return {
	'folke/tokyonight.nvim',
	'bluz71/vim-nightfly-colors',
	'lvimuser/lsp-inlayhints.nvim',
	'folke/neodev.nvim',
	'b0o/schemastore.nvim',
	{ 'tpope/vim-fugitive', cmd = 'G' },
	{ 'catppuccin/nvim', name = 'catppuccin' },
	{ 'windwp/nvim-autopairs', config = { check_ts = true }, event = 'BufReadPre' },
	{ 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
	{ 'ethanholz/nvim-lastplace', config = true, event = 'BufReadPre' },
	{'kylechui/nvim-surround', version = "*", config = true, event = 'InsertEnter'}
}

