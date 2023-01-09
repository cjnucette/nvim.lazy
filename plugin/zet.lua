-- command! -nargs=* Zet call local#zettel#edit(<f-args>)
vim.api.nvim_create_user_command('Zet', 'call local#zettel#edit(<f-args>)', { nargs = '*' })
