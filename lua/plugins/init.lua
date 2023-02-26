return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000,
		cond = vim.fn.hostname() ~= 'alpha',
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
				style = 'night'
			}
			require('tokyonight').setup(opts)
			vim.cmd.colorscheme('tokyonight')
		end
	},
	'bluz71/vim-nightfly-colors',
	'b0o/schemastore.nvim',
	{ 'rafcamlet/nvim-luapad',  cmd = { 'Luapad', 'LuaRun' } },
	{ 'tpope/vim-fugitive',     cmd = 'G' },
	-- { 'ethanholz/nvim-lastplace', config = true, event = 'BufReadPre' },
	-- {
	-- 	'altermo/ultimate-autopair.nvim',
	-- 	event = { 'InsertEnter', 'CmdlineEnter' },
	-- 	config = true
	-- },
	{ 'kylechui/nvim-surround', version = '*',               config = true, event = 'InsertEnter' },
	{ 'stevearc/oil.nvim',      config = true,               cmd = 'Oil' },
	{ 'windwp/nvim-autopairs',
		event = { 'BufReadPre', 'BufNewFile' },
		opts = { check_ts = true }
	},
	{ 'lvimuser/lsp-inlayhints.nvim', opts = {
		inlay_hints = {
			type_hints = {
				separator = ''
			},
			only_current_line = true
		}
	} },
	-- dev
	{ 'cjnucette/scripts.nvim', dev = true }
}
