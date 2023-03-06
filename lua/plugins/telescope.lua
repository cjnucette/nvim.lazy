return {
	'nvim-telescope/telescope.nvim',
	version = false,
	cmd = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			'<leader>?',
			function() require('telescope.builtin').oldfiles() end,
			desc = 'Telescope: [?] Find recently opened files'
		},
		{ '<leader>b', function() require('telescope.builtin').buffers() end, desc = 'Telescope: Find existing [b]uffers' },
		{
			'<leader>/',
			function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end,
			desc = 'Telescope: [/] Fuzzily search in current buffer]'
		},

		{
			'<C-p>',
			function()
				local git = pcall(require('telescope.builtin').git_files, {})
				if not git then
					require('telescope.builtin').find_files({})
				end
			end,
			desc = 'Telescope: Search Files'
		},
		{ '<leader>sf', function() require('telescope.builtin').find_files() end, desc = 'Telescope: [S]earch [F]iles' },
		{ '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = 'Telescope: [S]earch [H]elp' },
		{
			'<leader>sw',
			function() require('telescope.builtin').grep_string() end,
			desc = 'Telescope: [S]earch current [W]ord'
		},
		{ '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = 'Telescope: [S]earch by [G]rep' },
		{
			'<leader>sd',
			function() require('telescope.builtin').diagnostics() end,
			desc = 'Telescope: [S]earch [D]iagnostics'
		},
		{ '<leader>sk', function() require('telescope.builtin').keymaps() end, desc = 'Telescope: [S]earch [K]eymaps' },
	},
	config = function()
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
}
