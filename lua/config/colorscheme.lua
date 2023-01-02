vim.opt.termguicolors = true
vim.opt.background = 'dark'

local tokyonight = require('tokyonight')
local opts = {}

if vim.fn.hostname() == 'alpha' then
	opts.style = 'moon'
else
	opts.style = 'night'
end

tokyonight.setup(opts)

tokyonight.load()
