-- Bootstrap lazy if not installed
local lazypath = vim.fn.stdpath('config') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Install plugins
local opts = {
	root = vim.fn.stdpath('config') .. '/lazy',
	defaults = { lazy = true },
	install = { colorscheme = { 'nightfly', 'tokyonight' } },
	checker = { enabled = true },
	change_detection = {
		notify = false
	},
	peformance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'matchit',
				'matchparen',
				'netrwPlugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin'
			}
		}
	}
}

require('lazy').setup('user.plugins', opts)

-- don't load the plugins below
local builtins = {
	'gzip',
	'zip',
	'zipPlugin',
	'fzf',
	'tar',
	'tarPlugin',
	'getscript',
	'getscriptPlugin',
	'vimball',
	'vimballPlugin',
	'2html_plugin',
	'matchit',
	'matchparen',
	'logiPat',
	'rrhelper',
	'netrw',
	'netrwPlugin',
	'netrwSettings',
	'netrwFileHandlers',
}

for _, plugin in ipairs(builtins) do
	vim.g['loaded_' .. plugin] = 1
end

require('user.utils').map('n', '<leader>ld', ':Lazy<CR>', { desc = 'Lazy: Go back to plugin list' })
require('user.utils').map('n', '<leader>li', ':Lazy install<CR>', { desc = 'Lazy: Install plugins' })
require('user.utils').map('n', '<leader>lu', ':Lazy update<CR>', { desc = 'Lazy: Update plugins' })
require('user.utils').map('n', '<leader>ls', ':Lazy sync<CR>', { desc = 'Lazy: Sync plugins' })
require('user.utils').map('n', '<leader>lc', ':Lazy clear<CR>', { desc = 'Lazy: Clean plugins' })
require('user.utils').map('n', '<leader>lp', ':Lazy profile<CR>', { desc = 'Lazy: Profile plugins' })
