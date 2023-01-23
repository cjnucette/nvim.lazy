local map = require('utils').map

return {
	'Exafunction/codeium.vim',
	lazy = false,
	config = function()
		-- vim.g.codeium_disable_bindings = true
		-- map('i', '<C-p>', '<Plug>(codeium-next)', { desc = 'Codeium: Next completion' })
		-- map('i', '<C-n>', '<Plug>(codeium-previous)', { desc = 'Codeium: Prev completion' })
		-- map('i', '<C-c>', '<Plug>(codeium-dismiss)', { desc = 'Codeium: Clear suggestions' })
		-- map('i', '<C-cr>', '<Plug>(codeium-complete)', { desc = 'Codeium: Accepts suggestion' })
	end
}
