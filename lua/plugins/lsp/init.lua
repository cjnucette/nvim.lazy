local M = {
	{
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		dependencies = {
			{ 'folke/neodev.nvim', config = true },
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/typescript.nvim',
			'simrat39/rust-tools.nvim',
			'lvimuser/lsp-inlayhints.nvim',
			'marilari88/twoslash-queries.nvim'
		},
		config = function()
			-- lspinfo window border
			require('lspconfig.ui.windows').default_options.border = 'rounded'

			require('plugins.lsp.diagnostics').setup()

			local on_attach = function(client, bufnr)
				require('plugins.lsp.keys').setup(bufnr)
				require('plugins.lsp.formatting').setup(client, bufnr)
				require('plugins.lsp.autocmds').setup(client, bufnr)

				-- navic
				if client.server_capabilities.documentSymbolProvider or client.name ~= 'astro' then
					if pcall(require, 'nvim-navic') then
						require('nvim-navic').attach(client, bufnr)
					end
				end

				-- inlayhints
				if client.server_capabilities.inlayHintProvider then
					require('lsp-inlayhints').on_attach(client, bufnr, true)
				end
			end

			-- nvim-cmp supports additional completion capabilities
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			if pcall(require, 'cmp_nvim_lsp') then
				capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
			end

			local handlers = {
				['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
				['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single' }),
			}

			local function get_server_options(lsp)
				local opts = {
					on_attach = on_attach,
					capabilities = capabilities,
					handlers = handlers
				}

				if pcall(require, 'plugins/lsp/lsp_servers/' .. lsp) then
					local custom_opts = require('plugins/lsp/lsp_servers/' .. lsp)

					opts = vim.tbl_extend('force', opts, custom_opts)

					opts.on_attach = function(client, bufnr)
						on_attach(client, bufnr)
						if custom_opts.on_attach then
							custom_opts.on_attach(client, bufnr)
						end
						if lsp == 'tsserver' then
							require('twoslash-queries').attach(client, bufnr)
						end
					end
				end

				return opts
			end

			local servers = require('mason-lspconfig').get_installed_servers()
			local skipped_servers = { 'tsserver', 'rust_analyzer' }

			for _, lsp in ipairs(servers) do
				local opts = get_server_options(lsp)

				if not vim.tbl_contains(skipped_servers, lsp) then
					require('lspconfig')[lsp].setup(opts)
				end

				if lsp == 'tsserver' then
					if pcall(require, 'typescript') then
						require('typescript').setup({ server = opts })
					else
						require('lspconfig')['tsserver'].setup(opts)
					end
				end

				if lsp == 'rust_analyzer' then
					if pcall(require, 'rust-tools') then
						require('rust-tools').setup({
							server = opts,
							tools = {
								inlay_hints = { auto = false }
							}
						})
					else
						require('lspconfig')['rust_analyzer'].setup(opts)
					end
				end
			end
		end
	},
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		keys = { { '<leader>lm', '<cmd>Mason<cr>', desc = 'Mason: open dashboard' } },
		opts = {
			ui = { border = 'rounded' },
			install_root_dir = vim.fn.stdpath('config') .. '/mason'
		}
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'sumneko_lua',
				'vimls',
				'tsserver',
				'html',
				'cssls',
				'jsonls',
				'bashls',
				'ltex',
				'denols',
				'rust_analyzer',
				'eslint',
				'svelte'
			}
		}
	},
	{
		'jay-babu/mason-null-ls.nvim',
		opts = {
			ensure_installed = { 'prettier', 'shfmt', 'shellcheck' }
		}
	},
	{
		'marilari88/twoslash-queries.nvim',
		config = function()
			require('twoslash-queries').setup({
				highlight = 'Comment'
			})
		end
	}
}

return M
