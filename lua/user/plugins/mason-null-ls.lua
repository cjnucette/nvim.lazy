local M = {
	'jay-babu/mason-null-ls.nvim',
}


function M.config()
	local linters = { 'prettier', 'shfmt', 'shellcheck' }
	require('mason-null-ls').setup({
		ensure_installed = linters
	})

end

return M
