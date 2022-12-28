local root = vim.fn.fnamemodify('./.repro', ':p')

-- set stdpaths to use .repro
for _, name in ipairs({ 'config', 'data', 'state', 'cache' }) do
	vim.env[('XDG_%s_HOME'):format(name:upper())] = root .. '/' .. name
end

-- bootstrap lazy
local lazypath = root .. '/plugins/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- install plugins
local plugins = {
	-- do not remove the colorscheme!
	'folke/tokyonight.nvim',

	-- add any other pugins here
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup {
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = { 'html' },
				highlight = { enable = true },
				indent = { enable = true, },
			}
		end
	}
}
require('lazy').setup(plugins, {
	root = root .. '/plugins',
})

-- add anything else here
vim.opt.termguicolors = true
-- do not remove the colorscheme!
vim.cmd([[colorscheme tokyonight]])
