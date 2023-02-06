return {
	'folke/trouble.nvim',
	cmd = { 'TroubleToggle', 'Trouble' },
	opts = { use_diagnostic_signs = true },
	keys = {
		{ '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble: Document Diagnostics (Trouble)' },
		{ '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble: Workspace Diagnostics (Trouble)' },
	},
}
