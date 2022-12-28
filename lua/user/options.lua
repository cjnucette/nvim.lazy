-- setup leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- settings
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.modeline = true
vim.opt.updatetime = 250
vim.cmd([[set shortmess+=c]])

vim.opt.number = true
vim.opt.signcolumn = 'number'

--statusline
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.shiftround = true

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

-- folding
local function my_fold_text()
	local indent = vim.fn.indent(vim.v.foldstart) - vim.opt.shiftwidth:get()
	return string.rep(' ', indent) .. vim.fn.getline(vim.v.foldstart) .. '...' .. vim.fn.getline(vim.v.foldend)
end

vim.opt.foldenable = true
vim.cmd([[ set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend)) ]])
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
vim.opt.fillchars = { fold = ' ', eob = ' ', foldclose = '›', foldopen = '‹' }

--- undo ---
if vim.fn.has('persistent_undo') then
	vim.opt.undodir = vim.fn.expand('~/.undodir') -- ~ doesn't expand in lua
	vim.opt.undofile = true
end
