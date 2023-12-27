local M = {
	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'folke/neodev.nvim', config = true },
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'simrat39/rust-tools.nvim',
			'marilari88/twoslash-queries.nvim'
		},
		config = function()
			require('lspconfig.ui.windows').default_options.border = 'rounded'
			require('plugins.lsp.diagnostics').setup()
			local get_server_options = require('plugins.lsp.server-options').get_server_options

			require('mason-lspconfig').setup_handlers({
				function(lsp)
					local opts = get_server_options(lsp)
					require('lspconfig')[lsp].setup(opts)
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
			automatic_installation = true,
			ensure_installed = {
				'lua_ls',
				'vimls',
				'tsserver',
				'html',
				'cssls',
				'emmet_language_server',
				'jsonls',
				'bashls',
				'rust_analyzer',
				'eslint',
				'svelte',
				'ltex'
			}
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
