local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user_cmds = augroup('user_autocommands', { clear = true })
autocmd(
	'FileType',
	{
		desc = 'Use q to close the window',
		group = user_cmds,
		pattern = { 'oil', 'help', 'man', 'fugitive', 'qf', 'notify', 'lspinfo', 'checkhealth', 'git' },
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

autocmd('BufRead', {
	desc = 'Place the cursor on the last place you where in a file and center buffer around it',
	group = user_cmds,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			if pcall(vim.api.nvim_win_set_cursor, 0, mark) then
				vim.cmd.normal('zz')
			end
		end
	end,
})

autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
	desc = 'Check for external changes to file and reload it',
	group = user_cmds,
	command = 'checktime',
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

vim.api.nvim_create_autocmd('BufNewFile', {
	desc = 'Load skeleton file when a new empty file is created.',
	group = vim.api.nvim_create_augroup('init-lua', { clear = true }),
	callback = function()
		local skeleton_name = vim.fn.stdpath('config') .. '/templates/skeleton.' .. vim.fn.expand('<afile>:e')
		if vim.loop.fs_stat(skeleton_name) then
			vim.cmd.read({ args = { skeleton_name }, range = { 0, 0 } })
		end
	end,
})

-- saves the current state of a buffer
local view_group = augroup('auto_view', { clear = true })

autocmd({ 'BufWinLeave', 'BufWritePost', 'WinLeave' }, {
	desc = 'Save view with mkview for real files',
	group = view_group,
	callback = function(args)
		if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
	end,
})

autocmd('BufWinEnter', {
	desc = 'Try to load file view if available and enable view saving for real files',
	group = view_group,
	callback = function(args)
		if not vim.b[args.buf].view_activated then
			local filetype = vim.api.nvim_get_option_value('filetype', { buf = args.buf })
			local buftype = vim.api.nvim_get_option_value('buftype', { buf = args.buf })
			local ignore_filetypes = { 'gitcommit', 'gitrebase', 'svg', 'hgcommit' }
			if buftype == '' and filetype and filetype ~= '' and not vim.tbl_contains(ignore_filetypes, filetype) then
				vim.b[args.buf].view_activated = true
				vim.cmd.loadview { mods = { emsg_silent = true } }
			end
		end
	end,
})
