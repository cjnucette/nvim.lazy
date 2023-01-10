-- load options here, so options are correctly applied
require('config.options')

-- 💤  plugin manager
require('config.lazy')

-- mappings and autocmds can wait
vim.api.nvim_create_autocmd('User', {
	pattern = 'VeryLazy',
	callback = function()
		require('config.mappings')
		require('config.autocmds')
	end
})


require('config.colorscheme')

-- get bash aliases
vim.env.BASH_ENV = './.vim_bash_env'
