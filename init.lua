require('config.options')

-- plugin manager
require('config.lazy')

vim.api.nvim_create_autocmd('User', {
	pattern = 'VeryLazy',
	callback = function()
		require('config.mappings')
		require('config.autocmds')
	end
})


require('config.colorscheme')

-- local reload = require('utils').reload
-- require('utils').map('n', '<leader>rp', function() reload('todo') end)

-- get bash aliases
vim.env.BASH_ENV = './.vim_bash_env'
