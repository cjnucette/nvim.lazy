local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_cmds = augroup('user_autocommands', { clear = true })
autocmd(
'FileType',
	{
		desc = 'Use q to close the window',
		group = user_cmds,
		pattern = { 'help', 'man', 'fugitive', 'qf', 'notify', 'lspinfo' },
		command = 'nnoremap <buffer> q :quit<cr>'
	}
)

autocmd(
'TextYankPost',
	{
		desc = 'Highlight yanked objects',
		group = user_cmds,
		callback = function()
			vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
		end
	}
)

autocmd('BufReadPost', {
	desc = 'Place the cursor on the last place you where in a file',
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	group = user_cmds
})

autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	desc = 'Check for external changes to file and reload it',
	command = 'checktime',
	group = user_cmds
})

-- autocmd('BufWritePre', {
--  desc = "Create directory when needed, when saving a file"
-- 	group = user_cmds,
-- 	callback = function(event)
-- 		local file = vim.loop.fs_realpath(event.match) or event.match
--
-- 		vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
-- 		local backup = vim.fn.fnamemodify(file, ':p:~:h')
-- 		backup = backup:gsub('[/\\]', '%%')
-- 		vim.go.backupext = backup
-- 	end
-- })

autocmd('BufNewFile', {
	desc = 'Load template when a new empty html file is created.',
	group = user_cmds,
	pattern = '*.html',
	command = [[:0r ~/.config/nvim/templates/skeleton.html]]
})

autocmd('BufNewFile', {
	desc = 'Load template when a new empty shell script is created.',
	group = user_cmds,
	pattern = '*.sh',
	command = [[:0r ~/.config/nvim/templates/skeleton.sh]]
})
