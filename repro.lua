require('config/options')

local root = vim.fn.fnamemodify('~/.config/nvim/.repro', ':p')

-- set stdpaths to use .repro
for _, name in ipairs({ 'config', 'data', 'state', 'cache' }) do
	vim.env[('XDG_%s_HOME'):format(name:upper())] = root .. '/' .. name
end

-- bootstrap lazy
local lazypath = root .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
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
	root = root .. '/lazy',
})

-- add anything else here
-- do not remove the colorscheme!
vim.opt.termguicolors = true
vim.cmd([[colorscheme tokyonight]])
