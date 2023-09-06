return {
	'echasnovski/mini.nvim',
	version = false, -- wait till new 0.7.0 release to put it back on semver
	event = 'BufReadPre',
	config = function()
		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
			callback = function()
				vim.b.miniindentscope_disable = true
			end,
		})

		require('mini.indentscope').setup({
			-- symbol = "▏",
			symbol = '│',
			options = { try_as_border = true },
		})

		local miniclue = require('mini.clue')
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = 'n', keys = '<Leader>' },
				{ mode = 'x', keys = '<Leader>' },

				-- Built-in completion
				{ mode = 'i', keys = '<C-x>' },

				-- `g` key
				{ mode = 'n', keys = 'g' },
				{ mode = 'x', keys = 'g' },

				-- Marks
				{ mode = 'n', keys = "'" },
				{ mode = 'n', keys = '`' },
				{ mode = 'x', keys = "'" },
				{ mode = 'x', keys = '`' },

				-- Registers
				{ mode = 'n', keys = '"' },
				{ mode = 'x', keys = '"' },
				{ mode = 'i', keys = '<C-r>' },
				{ mode = 'c', keys = '<C-r>' },

				-- Window commands
				{ mode = 'n', keys = '<C-w>' },

				-- `z` key
				{ mode = 'n', keys = 'z' },
				{ mode = 'x', keys = 'z' },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
