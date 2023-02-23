local M = {}
local utils = require('plugins.lsp.utils')
-- tsserver
local inlay_hints = {
	includeInlayEnumMemberValueHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayParameterNameHints = 'all', -- 'none' | 'literals' | 'all';
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayVariableTypeHints = true,
}

M.options = {
	['cssls'] = {
		on_attach = utils.on_attach(function(client, _)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
		end),

		settings = {
			css = {
				-- lint = {
				-- 	unknownAtRules = 'ignore'
				-- },
				format = {
					enable = true
				}
			},
		}
	},
	['emmet_ls'] = {
		filetypes = { 'css', 'scss' }
	},
	['html'] = {
		on_attach = utils.on_attach(function(client, _)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
		end),

		settings = {
			html = {
				autoClosingTags = true,
				autoCreateQuotes = true,
				format = {
					enable = true,
					indentInnerHtml = true,
					templating = true,
					wrapLineLength = 120,
					wrapAttributes = 'auto',
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
	},
	['jsonls'] = {
		on_attach = utils.on_attach(function(client, _)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
		end),

		settings = {
			json = {
				schemas = require('schemastore').json.schemas(),
				validate = { enable = true },
				format = { enable = true },
			}
		}
	},
	['ltex'] = {
		settings = {
			ltex = {
				completionEnabled = false,
				checkFrequency = 'edit'
			}
		}
	},
	['lua_ls'] = {
		on_attach = utils.on_attach(function(client, _)
			client.server_capabilities.documentFormattingProvider = true
			client.server_capabilities.documentRangeFormattingProvider = true
		end),

		settings = {
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

	},
	['tsserver'] = {
		on_attach = utils.on_attach(function(client, bufnr)
			require('twoslash-queries').attach(client, bufnr)
		end),
		root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json'),
		single_file_support = not require('lspconfig.util').root_pattern('deno.json*'),

		settings = {
			javascript = {
				inlayHints = inlay_hints,
			},
			typescript = {
				inlayHints = inlay_hints,
			}
		},
	}
}
return M
