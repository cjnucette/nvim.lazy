return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v3.x',
	cmd = { 'NeoTreeReveal', 'Neotree' },
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	},
	keys = {
		{
			'<leader>e',
			'<cmd>Neotree toggle float<CR>',
			noremap = true,
			silent = true,
			desc = 'NeoTree: Toggle file explorer'
		},
		{
			'<leader>ef',
			'<cmd>Neotree toggle float<CR>',
			noremap = true,
			silent = true,
			desc = 'NeoTree: Toggle file explorer'
		},
		{
			'<leader>el',
			'<cmd>Neotree toggle left<CR>',
			noremap = true,
			silent = true,
			desc = 'NeoTree: Open file [e]xplorer [l]eft'
		},
		{
			'<leader>er',
			'<cmd>Neotree toggle right<CR>',
			noremap = true,
			silent = true,
			desc = 'NeoTree: Open file [e]xplorer [r]ight'
		}
	},
	opts = function()
		local signs = require('utils').signs

		return {
			close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
			popup_border_style = 'rounded',
			follow_current_file = true,
			enable_git_status = true,
			enable_diagnostics = true,
			source_selector = {
				winbar = true,
				sources = {
					{ source = 'filesystem' },
					{ source = 'git_status' },
					{ source = 'buffers' },
				},
				content_layout = 'center', -- string
				tabs_layout = 'active',
			},
			default_component_configs = {
				container = {
					enable_character_fade = true
				},
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
				diagnostics = {
					symbols = {
						hint = signs.hint,
						info = signs.information,
						warn = signs.warning,
						error = signs.error
					}
				}
			},
			window = {
				-- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
				width = 30,
				position = 'float',
				popup = {
					-- settings that apply to float position only
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
	end
}
