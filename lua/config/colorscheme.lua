vim.opt.termguicolors = true
vim.opt.background = 'dark'

local tokyonight = require('tokyonight')

if vim.fn.hostname() == 'alpha' then
	tokyonight.setup({
		style = 'moon',
	})
end

tokyonight.load()
-- end
