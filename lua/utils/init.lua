local M = {}

M.map = function(mode, lhs, rhs, opts)
	opts = opts or {}
	local isPlug = false
	if type(rhs) == 'string' then
		isPlug = not not string.find(rhs, '<Plug>')
	end

	opts.silent = opts.silent == nil and true

	if isPlug then
		opts.noremap = false
	else
		opts.noremap = opts.noremap == nil and true
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

--- get_color returns a table with foreground, background, and special of a color group
---@param group string Color group name
---@return table | nil
M.get_color = function(group)
	local hl = vim.api.nvim_get_hl_by_name(group, true)
	if not hl then
		return nil
	end

	local fg = hl.foreground and string.format('#%06x', hl.foreground)
	local bg = hl.background and string.format('#%06x', hl.background)
	-- how to return the rest of the information bold, italic, etc.
	-- local sp = hl.special and hl.special

	return { fg = fg, bg = bg }
	-- return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
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
