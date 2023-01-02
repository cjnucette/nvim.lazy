local opts = {}

--[[
local package_prefix = vim.fn.expand((vim.env.XDG_CONFIG_HOME or '~/.config/nvim'))
local function is_package_path(path)
	if package_prefix ~= string.sub(path, 1, #package_prefix) then
		return false
	end

	return vim.fn.isdirectory(path .. '/lua') ~= 0
end
]]

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

opts.on_attach = function(client, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
end

opts.settings = {
	Lua = {
		runtime = {
			version = 'LuaJIT',
			path = runtime_path,
		},
		format = {
			enable = true,
			defaultConfig = {
				indent_style = 'tab',
				indent_size = '4',
				quote_style = 'single',
				call_arg_parentheses = 'keep',
				align_call_args = true,
			}
		},
		hint = {
			enable = true,
			setType = true,
		},
		diagnostics = {
			enable = true,
			disable = {
				'different-requires',
			},
			globals = { 'vim', 'P', 'R', 'it', 'describe', 'before_each', 'after_each' },
		},
		completion = {
			keywordSnippet = 'Replace',
			-- callSnippet = 'Replace'
			callSnippet = 'Replace',
			workspaceWord = true,
		},
		workspace = {
			-- library = library,
			-- library = vim.tbl_filter(is_package_path, vim.api.nvim_get_runtime_file('', true)),
			library = vim.api.nvim_get_runtime_file('', true),
			checkThirdParty = false,
		},
	},
}

return opts
