local fn = vim.fn
local M = {}

M.map = function(mode, lhs, rhs, opts)
	opts = opts or {}
	local isPlug = false
	if type(rhs) == 'string' then
		isPlug = not not string.find(rhs, '<Plug>')
	end

	opts.silent = opts.silent or true

	if isPlug then
		opts.noremap = false
	else
		opts.noremap = opts.noremap or true
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

M.signs = {
	-- diagnostics
	error        = '',
	warning      = '',
	information  = '',
	hint         = '',
	-- git
	branch       = '',
	add          = '+', -- 002b: +
	delete       = '-', -- f655: 
	topdelete    = '‾', -- f655: 
	changedelete = '␡', -- f655: 
	modify       = '~', -- 00b7: ·, Digraph: *-
	ignore       = '!',
	rename       = '', -- f553: 
	-- git status
	untracked    = '?', -- 003f: ?
	ignored      = 'ﯰ', -- 
	unstaged     = '',
	staged       = '', -- f634: 
	conflict     = '',
}

M.capitalize = function(str)
	return (str:gsub('^%l', string.upper))
end

M.get_color = function(group, attr)
	attr = attr or 'bg#'
	--  local tgc = vim.opt.termguicolors:get()
	--  local hl = vim.api.nvim_get_hl_by_name(hlgroup, tgc)
	-- if tgc then
	--    return  { fg = hl.foreground, bg = hl.background, sp = hl.special }
	--  else
	--    return  { ctermfg = hl.foreground, ctermbg = hl.background }
	--  end
	return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end


M.is_file_present = function(filename)
	return vim.fn.filereadable(vim.fn.expand(filename)) == 1
end

function M.is_empty(s)
	return s == nil or s == ''
end

function M.lsp_attached()
	-- return next(vim.lsp.buf_get_clients()) ~= nil
	return next(vim.lsp.get_active_clients({ buffer = 0 })) ~= nil
end

function M.p(args)
	print(vim.inspect(args))
end

function M.reload(pkg)
	package.loaded[pkg] = nil
	require(pkg)
end

return M
