local M = {
	'folke/noice.nvim',
	dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
	event = 'VeryLazy',
	opts = {
		lsp = {
			progress = { enabled = false },
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
	},
	keys = {
		{ '<s-enter>', function() require('noice').redirect(vim.fn.getcmdline()) end, mode = 'c',
			desc = 'Noice: Redirect command' },
		{ '<leader>nl', function() require('noice').cmd('last') end, desc = 'Noice: Show last message' },
		{ '<leader>nh', function() require('noice').cmd('history') end, desc = 'Noice: Show history' },
		{ '<leader>na', function() require('noice').cmd('all') end, desc = 'Noice: Show all messages' },
		{ '<c-f>', function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end, silent = true, expr = true,
			desc = 'Noice: Scroll forward' },
		{ '<c-b>', function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end, silent = true, expr = true,
			desc = 'Noice: Scroll backward' },
	}
}

return M
