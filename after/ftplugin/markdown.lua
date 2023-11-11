vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.conceallevel = 2

vim.keymap.set('n', '<leader>cm', "':e <c-r><c-w>.md'", { expr = true, desc = 'Markdown: [c]reates file under cursor' })
