return {
	{ 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
	'bluz71/vim-nightfly-colors',
	'folke/neodev.nvim',
	'b0o/schemastore.nvim',
	{ 'tpope/vim-fugitive', cmd = 'G' },
	{ 'catppuccin/nvim', name = 'catppuccin' },
	{ 'windwp/nvim-autopairs', config = { check_ts = true }, event = 'BufReadPre' },
	{ 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
	-- { 'ethanholz/nvim-lastplace', config = true, event = 'BufReadPre' },
	{ 'kylechui/nvim-surround', version = '*', config = true, event = 'InsertEnter' },
	{ 'lvimuser/lsp-inlayhints.nvim', config = {
		inlay_hints = {
			type_hints = {
				separator = ''
			},
			only_current_line = true
		}
	} },
}
