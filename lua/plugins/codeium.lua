local map = require('utils').map

return {
	'Exafunction/codeium.vim',
	event = "VeryLazy",
	config = function()
		map('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, {expr = true, desc = "Codeium: Next completion"} )
		map('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {expr = true, desc = "Codeium: Prev completion"} )
		map('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, {expr = true, desc = "Codeium: Clear suggestions"} )
		map('i', '<C-cr>', function() return vim.fn['codeium#Accept']() end, {expr = true, desc = "Codeium: Accepts suggestion"} )
	end
}
