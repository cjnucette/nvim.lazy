local M = {
	'williamboman/mason-lspconfig.nvim',
	event = 'VimEnter',
	dependencies = {
		'williamboman/mason.nvim'
	}
}

M.servers = { 'sumneko_lua', 'vimls', 'tsserver', 'html', 'cssls', 'jsonls', 'bashls', 'ltex', 'denols', 'rust_analyzer',
	'eslint' }

function M.config()
	require('mason-lspconfig').setup({
		ensure_installed = M.servers
	})
end

return M
