return {
	'folke/todo-comments.nvim',
	dependecies = {
		'folke/trouble.nvim'
	},
	event = 'BufReadPost',
	cmd = { 'TodoTrouble', 'TodoTelescope' },
	config = true,
	keys = {
		{ ']t', function() require('todo-comments').jump_next() end, desc = 'Todo Comment: next todo comment' },
		{ '[t', function() require('todo-comments').jump_prev() end, desc = 'Todo Comment: previous todo comment' },
		{ '<leader>xt', '<cmd>TodoTrouble<cr>', desc = 'Todo Comment: Todo (Trouble)' },
		{ '<leader>xT', '<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>', desc = 'Todo Comment: Todo/Fix/Fixme (Trouble)' },
		{ '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo Comment: Search todos in telescope' },
	}
}
