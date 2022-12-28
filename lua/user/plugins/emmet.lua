local M = {
	'mattn/emmet-vim',
	ft = { 'html', 'css', 'scss', 'javascriptreact', 'jsx', 'typescriptreact', 'tsx' }
}

function M.init()
	vim.g.user_emmet_install_global = 0
	vim.g.user_emmet_leader_key = ','

	vim.api.nvim_create_autocmd('FileType', {
		group = vim.api.nvim_create_augroup('user_emmet', { clear = true }),
		pattern = { 'html', 'css', 'scss', 'javascriptreact', 'jsx', 'typescriptreact', 'tsx' },
		command = 'EmmetInstall'
	})
end

return M
