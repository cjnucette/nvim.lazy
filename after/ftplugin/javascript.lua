vim.opt_local.foldmethod = 'expr'
vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt_local.foldlevel = 99
vim.cmd [[setlocal formatoptions-=cro]]

-- nnoremap <buffer><silent> <leader>cl viwyoconsole.log({<c-r>*});<esc>
require('utils').map('n', '<leader>cl', 'viwyoconsole.log({<C-r>*});<esc>', { buffer = 0 })
