return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000,
		cond = vim.fn.hostname() == 'beta',
		config = function()
			-- require('catppuccin').setup({
			-- 	flavour = 'mocha' -- latte, frappe, macchiato, mocha
			-- })
			vim.cmd.colorscheme('catppuccin')
		end
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		cond = vim.fn.hostname() == 'alpha',
		config = function()
			local opts = {
				style = 'moon'
			}
			require('tokyonight').setup(opts)
			vim.cmd.colorscheme('tokyonight')
		end
	},
	'bluz71/vim-nightfly-colors',
	'b0o/schemastore.nvim',
	{ 'rafcamlet/nvim-luapad', cmd = { 'Luapad', 'LuaRun' } },
	{ 'tpope/vim-fugitive', cmd = 'G' },
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
