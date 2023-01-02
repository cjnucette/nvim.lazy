vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- if vim.fn.hostname() == 'alpha' then
-- 	vim.g.nightflyUnderlineMatchParen = true
-- 	vim.cmd.colorscheme('nightfly')
-- else
local tokyonight = require('tokyonight')
tokyonight.setup({
	style = 'night',
})
tokyonight.load()
-- end
