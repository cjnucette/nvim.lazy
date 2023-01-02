local M = {}

function M.setup(client, bufnr)
	local user_lsp_cmds = vim.api.nvim_create_augroup('user_lsp_autocmds', { clear = true })
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd('CursorHold', {
			desc = 'Highlight matching words of word under the cursor',
			group = user_lsp_cmds,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			desc = 'Clear highlight matching words when cursor move',
			group = user_lsp_cmds,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
		})
	end

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			desc = 'Format on file save',
			group = user_lsp_cmds,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
end

return M
