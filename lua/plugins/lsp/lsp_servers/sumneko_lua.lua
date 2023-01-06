local opts = {}

opts.on_attach = function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end

opts.settings = {
	Lua = {
		runtime = {
			version = 'LuaJIT',
		},
		format = {
			enable = true,
			defaultConfig = {
				indent_style = 'tab',
				indent_size = '4',
				quote_style = 'single',
				call_arg_parentheses = 'keep',
				align_call_args = true,
			}
		},
		hint = {
			enable = true,
			setType = true,
		},
		diagnostics = {
			enable = true,
			disable = {
				'different-requires',
			},
			globals = { 'vim', 'P', 'R', 'it', 'describe', 'before_each', 'after_each' },
		},
		completion = {
			keywordSnippet = 'Replace',
			callSnippet = 'Replace',
			workspaceWord = true,
		},
		workspace = {
			checkThirdParty = false,
		},
	},
}

return opts
