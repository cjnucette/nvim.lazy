if vim.loader then
	vim.loader.enable()
end

-- load options here, so options are correctly applied
require('config.options')

-- 💤  plugin manager
require('config.lazy')

-- mappings and autocmds can wait unless a file is loaded.
if vim.fn.argc(-1) == 0 then
	vim.api.nvim_create_autocmd('User', {
		desc = 'autocmds and mappings can wait to load',
		group = vim.api.nvim_create_augroup('lazyvim', { clear = true }),
		pattern = 'VeryLazy',
		callback = function()
			require('config.autocmds')
			require('config.mappings')
		end
	})
else
	require('config.autocmds')
	require('config.mappings')
end

-- get bash aliases
vim.env.BASH_ENV = './.vim_bash_env'

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- python executable
vim.g.python3_host_prog = '~/.venv/' .. vim.fn.hostname() .. '/bin/python3'
