return {
	'toppair/peek.nvim',
	build = 'deno task --quiet build:fast',
	config = function()
		require('peek').setup()
	end,
	ft = 'markdown',
	cmd = 'MarkdownPreview',
	keys = function()
		vim.api.nvim_create_user_command('MarkdownPreview', function() require('peek').open() end, {})
		vim.api.nvim_create_user_command('MarkdownPreviewClose', function() require('peek').close() end, {})
		return {
			{ '<leader>mo', vim.cmd.MarkdownPreview, desc = 'Peek: [M]arkdown Preview [O]pen' },
			{ '<leader>mc', vim.cmd.MarkdownPreviewClose, desc = 'Peek: [M]arkdown Preview [C]lose' },
		}
	end,
}
