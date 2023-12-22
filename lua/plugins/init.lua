return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000,
		cond = vim.fn.hostname() == 'beta',
		config = function()
			require('catppuccin').setup({
				flavour = 'mocha' -- latte, frappe, macchiato, mocha
			})
			vim.cmd.colorscheme('catppuccin')
		end
	},
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		cond = vim.fn.hostname() == 'alpha',
		config = function()
			require('tokyonight').setup({
				style = 'night'
			})
			vim.cmd.colorscheme('tokyonight')
		end
	},
	'bluz71/vim-nightfly-colors',
	'b0o/schemastore.nvim',
	{ 'rafcamlet/nvim-luapad', cmd = { 'Luapad', 'LuaRun' } },
	{ 'tpope/vim-fugitive', cmd = 'G' },
	-- add ys, change cs, delete ds + char + motion, selection + S char, yss + char entire line.
	-- yst, cst, dst to add, change, or remove html tags
	-- ysa + curr char + new char to surround a surrounded token
	{ 'kylechui/nvim-surround', version = '*', config = true, event = 'InsertEnter' },
	{
		'windwp/nvim-autopairs',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = { check_ts = true }
	},
	-- dev
	{ 'cjnucette/scripts.nvim', dev = true }
}
