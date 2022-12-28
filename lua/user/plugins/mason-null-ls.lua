local M = {
	'jay-babu/mason-null-ls.nvim',
}

M.linters = { 'prettier', 'shfmt', 'shellcheck' }

function M.config()
	require('mason-null-ls').setup({
		ensure_installed = M.linters
	})

end

return M
