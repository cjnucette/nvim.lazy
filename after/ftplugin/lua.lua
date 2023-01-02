vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt_local.foldlevel = 99

-- vim.opt_local.formatoptions-=cro
vim.opt_local.include = 'require'
vim.opt_local.define = 'function'
vim.opt_local.suffixes:append('init.lua') -- not working, gf tries to open the folder.
vim.opt_local.suffixes:append('.lua')
vim.opt_local.path:append(vim.fn.stdpath('config') .. '/lua')
-- vim.opt_local.includeexpr = vim.fn.substitute(vim.v.fname, '\\.', '/', 'g')
vim.cmd [[setlocal includeexpr=substitute(v:fname,'\\.','/','g')]] -- so it resolves 'user.somefile' as 'user/somefile'

require('utils').map('n', '<leader>cl', 'viwyoP(<c-r>*)<esc>', { buffer = 0 })
require('utils').map('n', '<leader>cli', 'viwyoprint(vim.inspect(<c-r>*))<esc>', { buffer = 0 })
