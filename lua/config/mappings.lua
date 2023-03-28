local map = require('utils').map

-- mappings

map('n', '<leader>w', vim.cmd.w, { desc = 'Write buffer to disk' })
map('n', '<leader>ev', function() vim.cmd.edit('$MYVIMRC') end, { desc = 'Edit init.lua' })

map('n', '<tab>', vim.cmd.bn, { desc = 'Goto the next buffer' })
map('n', '<s-tab>', vim.cmd.bp, { desc = 'Goto the prev buffer' })

-- map('n', '<leader>u', 'mzviw~`z', { desc = 'Toggle capitalization of word under the cursor' })
map('n', '<leader>u', 'gUbel', { desc = 'Toggle capitalization of word under the cursor' })

-- up and down work as expected
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

map('v', '<', '<gv', { desc = 'Un-indent current selection and keep the selection' })
map('v', '>', '>gv', { desc = 'Indent current selection and keep the selection' })

map('n', '<a-j>', ':m .+1<CR>==', { desc = 'Move current line down keeping indentation' })
map('n', '<a-k>', ':m .-2<CR>==', { desc = 'Move current line up keeping indentation' })
map('v', '<a-j>', ":m '>+1<CR>gv=gv",
    { desc = 'Move current line up, keeping indentation and selection' })
map('v', '<a-k>', ":m '<-2<CR>gv=gv",
    { desc = 'Move current line up, keeping indentation and selection' })

map('n', '<leader>cn', ':help news<CR>', { desc = '[C]heck what is [n]ew in neovim' })
