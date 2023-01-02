local M = {}
local signs = require('utils').signs
local map = require('utils').map

function M.setup()
	vim.diagnostic.config({
		virtual_text = { spacing = 4, prefix = '● ' },
		severity_sort = true,
		update_in_insert = false,
		underline = true,
		float = {
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = ''
		}
	})

	-- vim.lsp.handlers['workspace/diagnostic/refresh'] = function(_, _, ctx)
	-- 	local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
	-- 	pcall(vim.diagnostic.reset, ns)
	-- 	return true
	-- end

	local sign = function(opts)
		vim.fn.sign_define(
		opts.name,
			{
				texthl = opts.name,
				text = opts.text,
				numhl = ''
			}
		)
	end

	sign({ name = 'DiagnosticSignError', text = signs.error })
	sign({ name = 'DiagnosticSignWarn', text = signs.warning })
	sign({ name = 'DiagnosticSignHint', text = signs.hint })
	sign({ name = 'DiagnosticSignInfo', text = signs.information })
end

map('n', '[d', vim.diagnostic.goto_next, { desc = 'Diagnostic: Goto next diagnostic' })
map('n', ']d', vim.diagnostic.goto_prev, { desc = 'Diagnostic: Goto previous diagnostic' })
map('n', '<leader>sd', vim.diagnostic.open_float, { desc = 'Diagnostic: Open diagnostics in floating window' })
map('n', '<leader>sq', vim.diagnostic.setloclist, { desc = 'Diagnostic:  in loclist' })

return M
