local opts = {}

opts.on_attach = function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end

opts.settings = {
	css = {
		format = {
			enable = true
		}
	}
}
return opts
