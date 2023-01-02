local M = {
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	cmd = { 'Telescope' },
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	}
}

function M.config()
	require('telescope').setup {
		defaults = {
			mappings = {
				i = {
					['<C-u>'] = false,
					['<C-d>'] = false,
				},
			},
		},
	}

	pcall(require('telescope').load_extension, 'fzf')

end

function M.init()
	-- maps
	vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles,
	               { desc = 'Telescope: [?] Find recently opened files' })
	vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Telescope: Find existing [b]uffers' })
	vim.keymap.set('n', '<leader>/', function()
		-- You can pass additional configuration to telescope to change theme, layout, etc.
		require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		                                                           winblend = 10,
		                                                           previewer = false,
		                                                       })
	end, { desc = 'Telescope: [/] Fuzzily search in current buffer]' })

	vim.keymap.set('n', '<C-p>', function()
		local git = pcall(require('telescope.builtin').git_files, {})
		if not git then
			require('telescope.builtin').find_files({})
		end
	end, { desc = 'Telescope: Search Files' })
	vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Telescope: [S]earch [F]iles' })
	vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Telescope: [S]earch [H]elp' })
	vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string,
	               { desc = 'Telescope: [S]earch current [W]ord' })
	vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Telescope: [S]earch by [G]rep' })
	-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
	vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = 'Telescope: [S]earch [K]eymaps' })
end

return M
