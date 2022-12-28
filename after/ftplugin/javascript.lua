vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- nnoremap <buffer><silent> <leader>cl viwyoconsole.log({<c-r>*});<esc>
require('user.utils').map('n', '<leader>cl', 'viwyoconsole.log({<C-r>*});<esc>', { buffer = 0 })
