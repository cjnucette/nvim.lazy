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

			require('plugins.lsp.diagnostics').setup()


			-- nvim-cmp supports additional completion capabilities
			local capabilities = lsp_utils.capabilities()
			local handlers = lsp_utils.handlers()

			local function get_server_options(lsp)
				local opts = {
					on_attach = lsp_utils.on_attach(),
					capabilities = vim.deepcopy(capabilities),
					handlers = handlers
				}

				if pcall(require, 'plugins/lsp/lsp_servers/' .. lsp) then
					local custom_opts = require('plugins/lsp/lsp_servers/' .. lsp)

					opts = vim.tbl_deep_extend('force', opts, custom_opts)

					opts.on_attach = lsp_utils.on_attach(function(client, bufnr)
						if custom_opts.on_attach then
							custom_opts.on_attach(client, bufnr)
						end
						if lsp == 'tsserver' then
							require('twoslash-queries').attach(client, bufnr)
						end
					end)
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
