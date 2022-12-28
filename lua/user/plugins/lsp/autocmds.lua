local M = {}

function M.setup(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		local hwuc = vim.api.nvim_create_augroup('HighlightWordUnderCursor', { clear = true })
		vim.api.nvim_create_autocmd('CursorHold', {
			group = hwuc,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.document_highlight()
			end,
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			group = hwuc,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.clear_references()
			end,
		})
	end

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('FormatOnSave', { clear = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end
end

return M
