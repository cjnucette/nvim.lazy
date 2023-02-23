local M = {}

M.on_attach = function(on_attach)
	return function(client, bufnr)
		require('plugins.lsp.keys').setup(bufnr)
		require('plugins.lsp.formatting').setup(client, bufnr)
		require('plugins.lsp.autocmds').setup(client, bufnr)

		-- inlayhints
		if client.server_capabilities.inlayHintProvider then
			require('lsp-inlayhints').on_attach(client, bufnr, true)
		end
		if on_attach then on_attach(client, bufnr) end
	end
end

return M
