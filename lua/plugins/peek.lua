local M = {
	'toppair/peek.nvim', build = 'deno task --quiet build:fast'
}

function M.config()
	require('peek').setup()
end

function M.init()
	local peek = require('peek')
	vim.api.nvim_create_user_command('MarkdownPreview', peek.open, {})
	vim.api.nvim_create_user_command('MarkdownPreviewClose', peek.close, {})

	vim.keymap.set('n', '<leader>mp', vim.cmd.MarkdownPreview, {
		noremap = true,
		silent = true,
		desc = 'Peek: [M]arkdown [P]review'
	})
end

return M
