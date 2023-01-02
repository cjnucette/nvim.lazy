if not pcall(require, 'schemastore') then return {} end

local opts = {}
opts.on_attach = function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end

opts.settings = {
	json = {
		schemas = require('schemastore').json.schemas(),
		validate = { enable = true },
		format = { enable = true },
	}
}

return opts
