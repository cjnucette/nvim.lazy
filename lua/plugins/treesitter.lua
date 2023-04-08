return {
	'nvim-treesitter/nvim-treesitter',
	version = false,
	-- build = function()
	-- 	pcall(require('nvim-treesitter.install').update { with_sync = true })
	-- end,
	build = ':TSUpdate',
	event = 'BufReadPost',
	dependencies = {
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
			rainbow = {
				enable = true,
				strategy = require('ts-rainbow.strategy.local')
			}
		}
	end
}
