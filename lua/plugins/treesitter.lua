return {
	'nvim-treesitter/nvim-treesitter',
	version = false,
	-- build = function()
	-- 	pcall(require('nvim-treesitter.install').update { with_sync = true })
	-- end,
	build = ':TSUpdate',
	event = 'BufReadPost',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
		'windwp/nvim-ts-autotag',
		'JoosepAlviste/nvim-ts-context-commentstring',
		'kevinhwang91/nvim-ufo',
		'HiPhish/nvim-ts-rainbow2'
	},
	keys = {
		{ '<C-space>', desc = 'Treesitter: Increment selection' },
		{ '<bs>', desc = 'Treesitter: Decrement selection', mode = 'x' },
		{ '<C-s>', desc = 'Treesitter: Increment selection by scope' },
	},
	config = function()
		require('nvim-treesitter.configs').setup {
			highlight = { enable = true },
			-- indent = { enable = true, disable = { 'jsx', 'tsx' } },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				'lua',
				'rust',
				'javascript',
				'typescript',
				'tsx',
				'vimdoc',
				'bash',
				'css',
				'html',
				'markdown',
				'markdown_inline',
				'regex',
				'vim',
				'http',
				'svelte',
				'astro'
			},
			autotag = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<C-space>',
					node_incremental = '<C-space>',
					scope_incremental = '<C-s>',
					node_decremental = '<bs>',
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
			rainbow = {
				enable = true,
				strategy = require('ts-rainbow.strategy.local')
			}
		}
	end
}
