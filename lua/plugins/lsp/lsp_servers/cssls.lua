local opts = {}

opts.on_attach = require('plugins.lsp.utils').on_attach(function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end)

opts.settings = {
	css = {
		lint = {
			unknownAtRules = 'ignore'
		},
		format = {
			enable = true
		}
	},
	scss = {
		lint = {
			unknownAtRules = 'ignore'
		},
		format = {
			enable = true
		}
	}
}
return opts
