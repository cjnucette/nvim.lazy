local opts = {}

local util = require('lspconfig.util')

local inlay_hints = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = true,
}

opts.on_attach = require('plugins.lsp.utils').on_attach(function(client, bufnr)
	require('twoslash-queries').attach(client, bufnr)
end)

opts.root_dir = util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json')
opts.single_file_support = not util.root_pattern('deno.json*')

opts.settings = {
	javascript = {
		inlayHints = inlay_hints,
		single_file_support = false
	},
	typescript = {
		inlayHints = inlay_hints,
		single_file_support = false
	}
}

return opts
