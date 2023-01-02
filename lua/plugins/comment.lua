local M = {
	'numToStr/Comment.nvim',
	keys = { 'gcc', 'gc', 'gbc', 'gb' },
	event = 'BufReadPre'
}

function M.config()
	require('Comment').setup({
		pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
	})
end

return M
