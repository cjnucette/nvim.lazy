local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_cmds = augroup('user_commands', { clear = true })
autocmd(
'FileType',
	{
		desc = 'Use q to close the window',
		group = user_cmds,
		pattern = { 'help', 'man', 'fugitive' },
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
