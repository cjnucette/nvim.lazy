vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- vim.opt.formatoptions-=cro
vim.opt.include = 'require'
vim.opt.define = 'function'
vim.opt.suffixes:append('init.lua')
vim.opt.suffixes:append('.lua')
vim.opt.path:append('/home/cjnucette/.config/nvim/lua/user')
-- vim.opt.path:append('/home/cjnucette/.config/nvim/after/plugin')

vim.cmd [[setlocal includeexpr=substitute(v:fname,'\\.','/','g')]]

require('user.utils').map('n', '<leader>cl', 'viwyoP(<c-r>*)<esc>', { buffer = 0 })
require('user.utils').map('n', '<leader>cli', 'viwyoprint(vim.inspect(<c-r>*))<esc>', { buffer = 0 })
