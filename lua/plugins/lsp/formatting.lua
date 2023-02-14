local M = {}
-- Create a command `:Format` local to the LSP buffer
function M.setup(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_buf_create_user_command(
			bufnr,
			'Format',
			function(_)
				if vim.lsp.buf.format then
					vim.lsp.buf.format()
				elseif vim.lsp.buf.formatting then
					vim.lsp.buf.formatting()
				end
			end,
			{ desc = 'Format current buffer with LSP' }
		)

		-- maps
		nmap('<leader>f', function()
			vim.cmd.Format()
		end, '[F]ormat current buffer')
		nmap('<leader>fs', function()
			vim.cmd.Format()
			vim.cmd.w()
		end, '[F]ormat and [s]ave current buffer')
	end
end

return M
