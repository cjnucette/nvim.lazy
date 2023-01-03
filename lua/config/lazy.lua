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
	install = { colorscheme = { 'tokyonight' } },
	checker = { enabled = true },
	change_detection = {
		notify = false
	},
	dev = {
		path = '~/Workspace/code/nvim/cjnucette'
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

require('lazy').setup('plugins', opts)

-- maps
local map = require('utils').map
map('n', '<leader>ld', ':Lazy<CR>', { desc = 'Lazy: Go back to plugin list' })
map('n', '<leader>li', ':Lazy install<CR>', { desc = 'Lazy: Install plugins' })
map('n', '<leader>lu', ':Lazy update<CR>', { desc = 'Lazy: Update plugins' })
map('n', '<leader>ls', ':Lazy sync<CR>', { desc = 'Lazy: Sync plugins' })
map('n', '<leader>lc', ':Lazy clear<CR>', { desc = 'Lazy: Clean plugins' })
map('n', '<leader>lp', ':Lazy profile<CR>', { desc = 'Lazy: Profile plugins' })
