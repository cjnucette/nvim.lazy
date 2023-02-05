return {
	'hrsh7th/nvim-cmp',
	version = false,
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-emoji',
		'saadparwaiz1/cmp_luasnip',
		'onsails/lspkind.nvim',
		'jcdickinson/codeium.nvim',
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local lspkind = require('lspkind')

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
					require('luasnip').lsp_expand(args.body)
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
				{ name = 'luasnip' },
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
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = '...'
				})
			},
			experimental = {
				ghost_text = { hl_group = 'LspCodeLens' },
				-- native_menu = false,
				-- native_menu_items = {
				-- 	{ name = '<C-p>', action = 'close' },
				-- }
			},
			mapping = {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<c-space>'] = cmp.mapping:complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true, }),

				-- super-tab completion
				['<Tab>'] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
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
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
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
}
