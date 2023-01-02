local opts = {}

opts.on_attach = function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end

opts.settings = {
	html = {
		autoClosingTags = true,
		autoCreateQuotes = true,
		format = {
			enable = true,
			-- indentInnerHtml = true,
			-- templating = true,
			-- wrapLineLength = 120,
			-- wrapAttributes = 'auto',
		},
		hover = {
			documentation = true,
			references = true,
		},
		suggest = {
			html5 = true,
		},
		validate = {
			scripts = true,
			styles = true
		}
	}
}

return opts
