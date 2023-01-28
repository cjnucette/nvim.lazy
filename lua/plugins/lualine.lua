local M = {
	'nvim-lualine/lualine.nvim',
	event = 'VimEnter',

	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'SmiteshP/nvim-navic',
		'WhoIsSethDaniel/lualine-lsp-progress',
		{ 'vuki656/package-info.nvim' }
	},
}

function M.config()
	local lualine = require('lualine')
	local signs = require('utils').signs
	local capitalize = require('utils').capitalize
	local lsp_attached = require('utils').lsp_attached
	local is_empty = require('utils').is_empty
	local navic = require('nvim-navic')


	local function has_space()
		return vim.o.columns >= 80
	end

	local function gps()
		if navic.is_available() then
			if not is_empty(navic.get_location()) then
				return '〉' .. navic.get_location()
			end
		end

		return ''
	end

	-- components
	local diagnostics = {
		'diagnostics',
		sources = { 'nvim_diagnostic', 'coc' },
		section = { 'error', 'warn', 'info', 'hint' },
		symbols = {
			error = signs.error .. ' ',
			warn = signs.warning .. ' ',
			info = signs.information .. ' ',
			hint = signs.hint .. ' '
		},
		-- colored = false,
		update_in_insert = false,
		always_visible = false
	}

	local mode = {
		'mode',
		fmt = function(str)
			if has_space() then
				return str
			else
				return '-' .. str:sub(1, 1) .. '-'
			end
		end,
	}

	local branch = {
		'branch',
		icons_enable = true,
		icon = signs.branch
	}

	local diff = {
		'diff',
		-- colored = false,
		symbols = {
			added = signs.add,
			modified = signs.modify,
			removed = signs.delete
		},
		cond = has_space,
	}

	local encoding = {
		'encoding',
		fmt = string.upper,
		cond = has_space
	}

	local fileformat = {
		'fileformat',
		cond = has_space
	}

	local filetype = {
		'filetype',
		icons_enable = true,
		on_click = function()
			vim.cmd.LspInfo()
		end,
		fmt = function(str)
			local output = str:sub(1, 0)

			if has_space() then
				output = capitalize(str)
			end

			if lsp_attached() then
				local space = has_space() and ' ' or ''
				output = output .. space .. ''
			end

			return output
		end
	}

	local function my_location()
		if has_space() then
			return 'Ln %l,Col %c'
		else
			return '%l,%c'
		end
	end

	local function spaces()
		local msg = 'Spaces: '
		if not has_space() then msg = 'S: ' end
		return msg .. vim.opt.shiftwidth:get()
	end

	local function package_info()
		if not has_space() then
			return ''
		end
		return require('package-info').get_status()
	end

	local function clock()
		if not has_space() then
			return ''
		end
		return ' ' .. os.date('%I:%M %p')
	end

	-- local function search_count()
	--   local search = vim.fn.searchcount({ maxcount = 0 })
	--   local search_current = search.current
	--   local search_total = search.total
	--   if search_current > 0 then
	--     return vim.fn.getreg('/') .. ':' .. search_current .. '/' .. search_total
	--   else
	--     return ''
	--   end
	-- end

	-- extensions
	local neo_tree = {
		sections = {
			lualine_a = {
				{
					'file_explorer',
					fmt = function() return 'File Explorer%=' end,
					icon = { '📂', color = { fg = 'orange' } },
				}
			}
		},
		filetypes = { 'neo-tree' }
	}

	local toggleterm = {
		sections = {
			lualine_a = {
				{
					'terminal',
					fmt = function() return 'Terminal%=' end,
					icon = { '◼️', color = { fg = 'orange' } },
				}
			}
		},
		filetypes = { 'toggleterm', 'fterm' }
	}

	local package_manager = {
		sections = {
			lualine_a = {
				{
					'lazy',
					fmt = function() return 'Lazy%=' end,
					-- icon = { '📦', color = { fg = 'orange' } },
					icon = '💤',
				}
			},
			lualine_z = { my_location }
		},
		filetypes = { 'lazy' }
	}

	local telescope = {
		sections = {
			lualine_a = {
				{
					'telescope',
					fmt = function() return 'Telescope%=' end,
					icon = { '🔭', color = { fg = 'orange' } },
				}
			},
		},
		filetypes = { 'TelescopePrompt' }
	}

	local mason = {
		sections = {
			lualine_a = {
				{
					'mason',
					fmt = function() return 'Mason%=' end,
					icon = { '🧭', color = { fg = 'orange' } },
				}
			},
		},
		filetypes = { 'mason' }
	}

	local checkhealth = {
		sections = {
			lualine_a = {
				{
					'checkhealth',
					fmt = function() return 'CheckHealth%=' end,
					icon = { ' ', color = { fg = 'red' } },
				}
			},
			lualine_z = { my_location }
		},
		filetypes = { 'checkhealth' }
	}

	lualine.setup({
		options = {
			global_status = true,
			component_separators = '',
			section_separators = '',
			-- color = 'Normal',
			color = 'BufferLineTab',
			theme = { normal = {} }
		},
		sections = {
			lualine_a = { diagnostics },
			lualine_b = { mode, branch, diff },
			lualine_c = { {
				on_click = function()
					vim.cmd.Lazy('update')
				end,
				require('lazy.status').updates,
				cond = require('lazy.status').has_updates
			}, package_info },
			lualine_x = {
				{
					'lsp_progress',
					display_components = { 'lsp_client_name', { 'percentage' } }
				},
				my_location
			},
			lualine_y = { spaces, encoding, fileformat },
			lualine_z = { filetype }
		},
		winbar = {
			lualine_a = {
				{
					'filetype',
					icon_only = true
				},
				{ 'filename',
					padding = 0,
					file_status = false,
					path = 1,
					symbols = {
						unnamed = ''
					}
				},
				gps
			},
			lualine_z = { clock }
		},
		inactive_winbar = {
			lualine_a = {
				{
					'filetype',
					icon_only = true
				},
				{ 'filename',
					padding = 0,
					file_status = false,
					path = 1,
					symbols = {
						unnamed = ''
					}
				},
			},
		},
		extensions = { neo_tree, toggleterm, package_manager, telescope, mason, checkhealth }
	})
end

return M
