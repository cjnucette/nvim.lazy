return {
	{ -- This plugin
		'Zeioth/compiler.nvim',
		cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
		dependencies = { 'stevearc/overseer.nvim' },
		opts = {},
		keys = {
			{
				'<F6>',
				'<cmd>CompilerOpen<CR>',
				noremap = true,
				silent = true,
				desc = "Compiler: Open compiler"
			},
			{
				'<S-F6>',
				'<cmd>CompilerStop<CR>' .. '<cmd>CompilerRedo<CR>',
				noremap = true,
				silent = true,
				desc = "Compiler: Redo last selected option"
			},
			{
				'<F7>',
				'<cmd>CompilerToggleResults<CR>',
				noremap = true,
				silent = true,
				desc = "Compiler: Toggle compiler results"
			},
		},
	},
	{ -- The task runner we use
		'stevearc/overseer.nvim',
		commit = '400e762648b70397d0d315e5acaf0ff3597f2d8b',
		cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
		opts = {
			task_list = {
				direction = 'bottom',
				min_height = 25,
				max_height = 25,
				default_detail = 1
			},
		},
	},
}
