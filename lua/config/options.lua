-- setup leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- settings
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.modeline = true
vim.opt.updatetime = 250
vim.opt.autoread = true
vim.opt.exrc = true
vim.cmd([[set shortmess+=c]])

vim.opt.number = true
vim.opt.signcolumn = 'number'

vim.opt.background = 'dark'
vim.opt.termguicolors = true

--statusline
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- uses tabstop's value
vim.opt.softtabstop = -1 -- uses shiftwidth's value
vim.opt.expandtab = false
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false
vim.opt.breakindent = true

vim.opt.digraph = true
vim.opt.nrformats:append({ 'alpha' })

vim.opt.ignorecase = false
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '·' }
vim.opt.fillchars = { eob = ' ' } -- removes those pesky ~ at the end of the file

vim.opt.clipboard:append({ 'unnamed', 'unnamedplus' })

vim.opt.backup = false
vim.opt.writebackup = false

-- autocomplete window transparency --
if vim.fn.exists('+pumblend') then -- feature detection ;)
	vim.opt.pumblend = 10
end
if vim.fn.exists('+winblend') then -- feature detection ;)
	vim.opt.winblend = 10
end

--- undo ---
if vim.fn.has('persistent_undo') then
	vim.opt.undodir = vim.fn.expand('~/.undodir') -- ~ doesn't expand in lua
	vim.opt.undofile = true
end
