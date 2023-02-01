local M = {
	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		lazy = false,
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'windwp/nvim-ts-autotag',
			'JoosepAlviste/nvim-ts-context-commentstring',
			'kevinhwang91/nvim-ufo'
		},

		config = function()
			require('nvim-treesitter.configs').setup {
				-- Add languages to be installed here that you want installed for treesitter
				ensure_installed = { 'lua', 'rust', 'javascript', 'typescript', 'tsx', 'help', 'bash',
					'css', 'html', 'markdown', 'markdown_inline', 'regex', 'vim', 'http', 'svelte' },

				highlight = { enable = true },
				indent = { enable = true, disable = { 'jsx', 'tsx' } },
				context_commentstring = {
					enable = true
				},
				autotag = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<c-backspace>',
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							['aa'] = '@parameter.outer',
							['ia'] = '@parameter.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							[']m'] = '@function.outer',
							[']]'] = '@class.outer',
						},
						goto_next_end = {
							[']M'] = '@function.outer',
							[']['] = '@class.outer',
						},
						goto_previous_start = {
							['[m'] = '@function.outer',
							['[['] = '@class.outer',
						},
						goto_previous_end = {
							['[M'] = '@function.outer',
							['[]'] = '@class.outer',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['<leader>a'] = '@parameter.inner',
						},
						swap_previous = {
							['<leader>A'] = '@parameter.inner',
						},
					},
				},
			}
		end
	},
	{
		'kevinhwang91/nvim-ufo',
		dependencies = {
			'kevinhwang91/promise-async',
		},
		config = function()
			local map = require('utils').map

			vim.opt.foldcolumn = '0'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
			vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

			map('n', '<space><space>', 'za', { desc = 'Unfold all' })
			map('n', 'zR', require('ufo').openAllFolds)
			map('n', 'zM', require('ufo').closeAllFolds)
			map('n', 'K', function()
				local winid = require('ufo').peekFoldedLinesUnderCursor()
				if not winid then vim.lsp.buf.hover() end
			end)

			require('ufo').setup({
				provider_selector = function(_bufnr, _filetype, _buftype)
					return { 'treesitter', 'indent' }
				end
			})
		end
	}
}
return M
