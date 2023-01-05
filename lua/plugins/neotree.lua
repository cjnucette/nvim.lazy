local M = {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	cmd = 'NeoTreeReveal',
	dependencies = {
		'nvim-lua/plenary.nvim',
		 'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	}
}

function M.config()
	local signs = require('utils').signs

	local config = {
		close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
		popup_border_style = 'rounded',
		follow_current_file = true,
		default_component_configs = {
			git_status = {
				symbols = {
					-- Change type
					-- NOTE: you can set any of these to an empty string to not show them
					added     = signs.add,
					deleted   = signs.delete,
					modified  = signs.modify,
					renamed   = signs.rename,
					untracked = signs.untracked,
					ignored   = signs.ignored,
					unstaged  = signs.unstaged,
					staged    = signs.staged, -- f634: 
					conflict  = signs.confict,
				},
				align = 'right',
			},
		},
		window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
			width = 30,
			position = 'float',
			popup = { -- settings that apply to float position only
				size = {
					height = '70%',
					width = '50%',
				},
			},
			mappings = {
				['l'] = 'open',
				['h'] = 'close_node',
			},
		},
		filesystem = {
			bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
			use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
			-- instead of relying on nvim autocmd events.
		},
	}

	require('neo-tree').setup(config)
end

function M.init()
	-- mappings
	vim.keymap.set('n', '<leader>t', '<cmd>NeoTreeReveal<CR>',
	               { noremap = true, silent = true, desc = 'NeoTree: Toggle file explorer' })
end

return M
