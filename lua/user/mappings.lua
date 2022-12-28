local function map_opts(bag)
	bag = bag or {}
	bag.noremap = bag.noremap or true
	bag.silent = bag.silent or true

	return bag
end

-- mappings

vim.keymap.set('n', '<leader>w', vim.cmd.w, map_opts({ desc = 'Write buffer to disk' }))
vim.keymap.set('n', '<leader>ev', function() vim.cmd.edit('$MYVIMRC') end, map_opts({ desc = 'Edit init.lua' }))

vim.keymap.set('n', '<tab>', vim.cmd.bn, map_opts({ desc = 'Goto the next buffer' }))
vim.keymap.set('n', '<tab>', vim.cmd.bp, map_opts({ desc = 'Goto the prev buffer' }))

vim.keymap.set('n', '<space><space>', 'za', map_opts({ desc = 'Unfold all' }))

vim.keymap.set('n', '<leader>u', 'mzviw~`z', map_opts({ desc = 'Toggle capitalization of word under the cursor' }))

vim.keymap.set('v', '<', '<gv', map_opts({ desc = 'Un-indent current selection and keep the selection' }))
vim.keymap.set('v', '>', '>gv', map_opts({ desc = 'Indent current selection and keep the selection' }))

vim.keymap.set('n', '<a-j>', ':m .+1<CR>==', map_opts({ desc = 'Move current line down keeping indentation' }))
vim.keymap.set('n', '<a-k>', ':m .-2<CR>==', map_opts({ desc = 'Move current line up keeping indentation' }))
vim.keymap.set('v', '<a-j>', ":m '>+1<CR>gv=gv",
               map_opts({ desc = 'Move current line up, keeping indentation and selection' }))
vim.keymap.set('v', '<a-k>', ":m '<-2<CR>gv=gv",
               map_opts({ desc = 'Move current line up, keeping indentation and selection' }))

vim.keymap.set('n', '<leader>cn', ':help news<CR>', map_opts({ desc = '[C]heck what is [n]ew in neovim' }))
