return {
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			local opts = {}
			if vim.fn.hostname() == 'alpha' then
				opts.style = 'moon'
			else
				opts.style = 'night'
			end

			require('tokyonight').setup(opts)
			vim.cmd.colorscheme('tokyonight')
		end
	},
	'bluz71/vim-nightfly-colors',
	'b0o/schemastore.nvim',
	{ 'rafcamlet/nvim-luapad', cmd = { 'Luapad', 'LuaRun' } },
	{ 'tpope/vim-fugitive', cmd = 'G' },
	{ 'catppuccin/nvim', name = 'catppuccin' },
	{ 'windwp/nvim-autopairs', opts = { check_ts = true }, event = 'BufReadPre' },
	-- { 'ethanholz/nvim-lastplace', config = true, event = 'BufReadPre' },
	{ 'kylechui/nvim-surround', version = '*', config = true, event = 'InsertEnter' },
	{ 'stevearc/oil.nvim', config = true, cmd = 'Oil' },
	{ 'lvimuser/lsp-inlayhints.nvim', opts = {
		inlay_hints = {
			type_hints = {
				separator = ''
			},
			only_current_line = true
		}
	} },
	{ 'lewis6991/gitsigns.nvim', opts = {
		numhl = true,
		signcolumn = false
	},
		event = 'BufReadPre'
	},
	-- dev
	-- { 'cjnucette/scripts.nvim', cmd = 'Scripts', dev = true }
}
