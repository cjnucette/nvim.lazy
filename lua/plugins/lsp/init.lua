local M = {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
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
			local lsp_utils = require('plugins.lsp.utils')
			-- lspinfo window border
			require('lspconfig.ui.windows').default_options.border = 'rounded'
			-- set diagnostics options
			require('plugins.lsp.diagnostics').setup()
			-- used by setup_handlers
			local server_options = require('plugins.lsp.server-options').options
			local function get_server_options(server)
				local lsp_opts = {
					on_attach = lsp_utils.on_attach(),
					capabilities = lsp_utils.capabilities(),
					handlers = lsp_utils.handlers()
				}
				return server_options[server]
					and vim.tbl_deep_extend('force', lsp_opts, server_options[server])
					or lsp_opts
			end
			-- automatic server configuration
			require('mason-lspconfig').setup_handlers({
				function(lsp)
					local opts = get_server_options(lsp)
					require('lspconfig')[lsp].setup(opts)
				end,
				['tsserver'] = function()
					local opts = get_server_options('tsserver')

					if pcall(require, 'typescript') then
						require('typescript').setup({ server = opts })
					else
						require('lspconfig')['tsserver'].setup(opts)
					end
				end,
				['rust_analyzer'] = function()
					local opts = get_server_options('rust_analyzer')

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
			})
		end
	},
	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		keys = { { '<leader>om', '<cmd>Mason<cr>', desc = 'Mason: [O]pen [M]ason dashboard' } },
		opts = {
			ui = { border = 'rounded' },
			install_root_dir = vim.fn.stdpath('config') .. '/mason'
		}
	},
	{
		'williamboman/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'lua_ls',
				'vimls',
				'tsserver',
				'html',
				'cssls',
				'emmet_ls',
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
