local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_cmds = augroup('user_commands', { clear = true })
autocmd(
'FileType',
	{
		pattern = { 'help', 'man' },
		group = user_cmds,
		desc = 'Use q to close the window',
		command = 'nnoremap <buffer> q :quit<cr>'
	}
)

autocmd(
'TextYankPost',
	{
		group = user_cmds,
		desc = 'Highlight yanked objects',
		callback = function()
			vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
		end
	}
)

-- autocmd('BufWritePre', {
-- 	group = augroup('auto_create_dir', { clear = true }),
-- 	callback = function(event)
-- 		local file = vim.loop.fs_realpath(event.match) or event.match
--
-- 		vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
-- 		local backup = vim.fn.fnamemodify(file, ':p:~:h')
-- 		backup = backup:gsub('[/\\]', '%%')
-- 		vim.go.backupext = backup
-- 	end
-- })

local skeletons = augroup('Skeletons', { clear = true })
autocmd('BufNewFile', {
	group = skeletons,
	pattern = '*.html',
	command = [[:0r ~/.config/nvim/templates/skeleton.html]]
})

autocmd('BufNewFile', {
	group = skeletons,
	pattern = '*.sh',
	command = [[:0r ~/.config/nvim/templates/skeleton.sh]]
})
