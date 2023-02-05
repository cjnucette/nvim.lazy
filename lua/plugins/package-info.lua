local M = {
	'vuki656/package-info.nvim',
	ft = 'package.json',
	dependencies = { 'MunifTanjim/nui.nvim' }
}

function M.config()
	require('package-info').setup()
end

function M.init()
	local map = require('utils').map

	map({ 'n' }, '<LEADER>ps', require('package-info').show, { desc = 'Package-info: Show dependecy versions' })
	map({ 'n' }, '<LEADER>ph', require('package-info').hide, { desc = 'Package-info: Hide dependency versions' })
	map({ 'n' }, '<LEADER>pt', require('package-info').toggle, { desc = 'Package-info: Toggle dependency versions' })
	map({ 'n' }, '<LEADER>pu', require('package-info').update, { desc = 'Package-info: Update dependency on the line' })
	map({ 'n' }, '<LEADER>pd', require('package-info').delete, { desc = 'Package-info: Delete dependency on the line' })
	map({ 'n' }, '<LEADER>pi', require('package-info').install, { desc = 'Package-info: Install a new dependency' })
	map({ 'n' }, '<LEADER>pp', require('package-info').change_version,
	    { desc = 'Package-info: Install a different dependency version' })
end

return M
