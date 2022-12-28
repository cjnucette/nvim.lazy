require('user.options')

-- plugin manager
require('user.setup-lazy')

vim.api.nvim_create_autocmd('User', {
	pattern = 'VeryLazy',
	callback = function()
		require('user.mappings')
		require('user.autocmds')
	end
})


require('user.colorscheme')

-- get bash aliases
vim.env.BASH_ENV = './.vim_bash_env'
