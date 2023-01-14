return {
	{ 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
	'bluz71/vim-nightfly-colors',
	'b0o/schemastore.nvim',
	{ 'rafcamlet/nvim-luapad', cmd = { 'Luapad', 'LuaRun' } },
	{ 'tpope/vim-fugitive', cmd = 'G' },
	{ 'catppuccin/nvim', name = 'catppuccin' },
	{ 'windwp/nvim-autopairs', opts = { check_ts = true }, event = 'BufReadPre' },
	{ 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
	-- { 'ethanholz/nvim-lastplace', config = true, event = 'BufReadPre' },
	{ 'kylechui/nvim-surround', version = '*', config = true, event = 'InsertEnter' },
	{ 'lvimuser/lsp-inlayhints.nvim', opts = {
		inlay_hints = {
			type_hints = {
				separator = ''
			},
			only_current_line = true
		}
	} },
	{ 'stevearc/oil.nvim', config = true, cmd = 'Oil' },
	-- dev
	-- { 'cjnucette/scripts.nvim', cmd = 'Scripts', dev = true }
}
