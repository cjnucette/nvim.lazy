local M = {
	'akinsho/nvim-bufferline.lua',
	version = '3.x',
	event = 'VimEnter',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
}

function M.config()
	local signs = require('utils').signs
	local severities = {
		'error',
		'warning'
	}

	require('bufferline').setup({
		options = {
			view = 'multiwindow',
			numbers = 'ordinal',
			left_trunc_marker = '',
			right_trunc_marker = '',
			modified_icon = '*',
			diagnostics = 'nvim_lsp',
			always_show_bufferline = true,
			diagnostics_indicator = function(_, _, diag)
				local s = {}
				for _, severity in ipairs(severities) do
					if diag[severity] then
						table.insert(s, signs[severity] .. ' ' .. diag[severity])
					end
				end
				return table.concat(s, ' ')
			end,
			offsets = {
				{
					filetype = 'neo-tree',
					text = 'Neo-tree',
					highlight = 'Directory',
					text_align = 'left'
				}
			}
		}
	})
end

return M
