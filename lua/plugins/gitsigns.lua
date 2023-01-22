local map = require('utils').map

return {
	'lewis6991/gitsigns.nvim',
	event = 'VeryLazy',

	config = function()
		require('gitsigns').setup {
			numhl = true,
			signcolumn = false,
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then return ']c' end
					vim.schedule(function() gs.next_hunk() end)
					return '<Ignore>'
				end, { buffer = bufnr, expr = true, desc = 'Gitsigns: Next hunk' })
				map('n', '[c', function()
					if vim.wo.diff then return '[c' end
					vim.schedule(function() gs.prev_hunk() end)
					return '<Ignore>'
				end, { buffer = bufnr, expr = true, desc = 'Gitsigns: Prev hunk' })

				-- Actions
				map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<cr>',
				    { buffer = bufnr, desc = 'Gitsigns: Stage the hunk at the cursor position' })
				map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<cr>',
				    { buffer = bufnr, desc = 'Gitsigns: Reset the lines of the hunk at the cursor postion' })
				map('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr, desc = 'Gitsigns: Stage all hunks in current buffer' })
				map('n', '<leader>hR', gs.reset_buffer,
				    { buffer = bufnr, desc = 'Gitsigns: Reset the lines of all hunks in the buffer' })
				map('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr, desc = 'Gitsigns: Undo the last call of stage_hunk' })
				map('n', '<leader>hp', gs.preview_hunk,
				    { buffer = bufnr, desc = 'Gitsigns: Preview the hunk at the cursor postion in a floating window' })
				map('n', '<leader>hb', function() gs.blame_line({ full = true }) end,
				    { buffer = bufnr, desc = 'Gitsigns: Run git blame on the current line and show results in floatin window' })
				map('n', '<leader>ht', gs.toggle_current_line_blame,
				    { buffer = bufnr, desc = 'Gitsigns: Toggles blame on the current line' })
				map('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Gitsigns: Shows diff against index' })
				map('n', '<leader>hD', function() gs.diffthis('~') end,
				    { buffer = bufnr, desc = 'Gitsigns: Shows diff against last commit' })
				map('n', '<leader>htd', gs.toggle_deleted, { buffer = bufnr, desc = 'Gitsigns: Toggles deleted' })

				-- Text object
				map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>',
				    { buffer = bufnr, desc = 'Gitsigns: Define text object ih' })
			end
		}
	end,
}
