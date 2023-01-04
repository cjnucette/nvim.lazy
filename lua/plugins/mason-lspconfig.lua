local M = {
	'williamboman/mason-lspconfig.nvim',
	event = 'VimEnter',
	dependencies = {
		'williamboman/mason.nvim'
	}
}


function M.config()
	local servers = { 'sumneko_lua', 'vimls', 'tsserver', 'html', 'cssls', 'jsonls', 'bashls', 'ltex', 'denols',
		'rust_analyzer', 'eslint', 'svelte' }
	require('mason-lspconfig').setup({
		ensure_installed = servers
	})
end

return M
