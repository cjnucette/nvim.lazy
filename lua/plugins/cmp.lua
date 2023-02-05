local M = {
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'hrsh7th/vim-vsnip-integ',
			{ 'dsznajder/vscode-es7-javascript-react-snippets', build = 'yarn install --frozen-lockfile && yarn compile' },
			{ 'fivethree-team/vscode-svelte-snippets' },
			'onsails/lspkind.nvim',
			'jcdickinson/codeium.nvim'
		},
		event = 'InsertEnter',
		config = function()
			local cmp = require('cmp')
			local lspkind_status, lspkind = pcall(require, 'lspkind')

			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert' }

			-- local select_opts = { behavior = cmp.SelectBehavior.Select }
			local feedkey = function(key, mode)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
			end

			local frmt_func
			if lspkind_status then
				frmt_func = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = '...'
				})
			else
				frmt_func = function(entry, item)
					local menu_icon = {
						nvim_lsp = 'λ',
						nvim_lua = '',
						luasnip = '⋗',
						buffer = 'Ω',
						path = '',
						git = ''
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end
			end

			local has_words_before = function()
				local unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
			end

			cmp.setup({
				completion = {
					completeopt = 'menu,menuone,noinsert',
				},
				snippet = {
					expand = function(args)
						vim.fn['vsnip#anonymous'](args.body)
					end
				},
				sources = {
					-- keyword_length: # of char to begin querying a source
					-- priority: sorts the completion list based on this number;
					-- otherwise order matter.
					{ name = 'nvim_lsp' },
					-- { name = 'nvim_lsp_signature_help' },
					{ name = 'nvim_lua' },
					{ name = 'codeium' },
					{ name = 'vsnip' },
					{ name = 'buffer' },
					{ name = 'path' },
					{ name = 'emoji' },
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered()
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = frmt_func
				},

				mapping = {
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<c-space>'] = cmp.mapping:complete(),
					-- ['<C-y>'] = cmp.config.disable,
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true, }),

					-- super-tab completion
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.fn['vsnip#available'](1) == 1 then
							feedkey('<Plug>(vsnip-expand-or-jump)', '')
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, {
						'i',
						's',
					}),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.fn['vsnip#available'](-1) == 1 then
							feedkey('<Plug>(vsnip-jump-prev)', '')
						else
							fallback()
						end
					end, {
						'i',
						's',
					}),
				},
			})

			if pcall(require, 'nvim-autopairs') then
				local cmp_autopairs = require('nvim-autopairs.completion.cmp')
				cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { text = '' } }))
			end

			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' },
					{ name = 'buffer' }
				})
			})
		end
	},
	{
		'jcdickinson/codeium.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim'
		},
		config = true
	}
}


return M
