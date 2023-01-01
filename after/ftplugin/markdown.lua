local map = require("user.utils").map
local opts = { buffer = 0 }

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true
vim.opt_local.conceallevel = 2

map('n', '<tab>', "<cmd>call search('\\[[^]]*\\]([^)]\\+)')<cr>", opts)
map('n', '<s-tab>', "<cmd>call search('\\[[^]]*\\]([^)]\\+)', 'b')<cr>", opts)
