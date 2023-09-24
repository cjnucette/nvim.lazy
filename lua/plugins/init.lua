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
	-- {ys,cs,ds} + motion, S + selection
	{ 'kylechui/nvim-surround', version = '*', config = true, event = 'InsertEnter' },
	{
		'windwp/nvim-autopairs',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = { check_ts = true }
	},
	-- {
	-- 	'lvimuser/lsp-inlayhints.nvim',
	-- 	opts = {
	-- 		inlay_hints = {
	-- 			type_hints = {
	-- 				separator = ''
	-- 			},
	-- 			only_current_line = true
	-- 		}
	-- 	}
	-- },
	{
		'stevearc/oil.nvim',
		opts = {},
		keys = {
			{ '-', function() require('oil').open() end, desc = '[Oil] open oil buffer' },
		}
	},
	-- dev
	{ 'cjnucette/scripts.nvim', dev = true }
}
