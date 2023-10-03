local M = {}

M.on_attach = function(on_attach)
	return function(client, bufnr)
		require('plugins.lsp.keys').setup(bufnr)
		require('plugins.lsp.formatting').setup(client, bufnr)
		require('plugins.lsp.autocmds').setup(client, bufnr)

		-- inlayhints
		-- if client.server_capabilities.inlayHintProvider then
		-- 	require('lsp-inlayhints').on_attach(client, bufnr, true)
		-- end

		if on_attach then on_attach(client, bufnr) end
	end
end

M.capabilities = function()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	if pcall(require, 'cmp_nvim_lsp') then
		capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
	end

	return capabilities
end

M.handlers = function()
	return {
		['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
		['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
	}
end
return M
