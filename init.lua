-- load options here, so options are correctly applied
require('config.options')
-- Some autocmds don't work if loaded in the autocmd below
require('config.autocmds')

-- 💤  plugin manager
require('config.lazy')

-- mappings and autocmds can wait
vim.api.nvim_create_autocmd('User', {
	pattern = 'VeryLazy',
	callback = function()
		require('config.mappings')
	end
})

-- get bash aliases
vim.env.BASH_ENV = './.vim_bash_env'
