local M = {
	'vuki656/package-info.nvim',
	ft = 'package.json',
	dependencies = {'MunifTanjim/nui.nvim'}
}

function M.config()
	require('package-info').setup()
end

function M.init()
	local map = require('user.utils').map

	map({ "n" }, "<LEADER>ns", require("package-info").show, { desc = 'Package-info: Show dependecy versions'})
	map({ "n" }, "<LEADER>nh", require("package-info").hide, { desc = 'Package-info: Hide dependency versions'})
	map({ "n" }, "<LEADER>nt", require("package-info").toggle, { desc = 'Package-info: Toggle dependency versions'})
	map({ "n" }, "<LEADER>nu", require("package-info").update, { desc = 'Package-info: Update dependency on the line'})
	map({ "n" }, "<LEADER>nd", require("package-info").delete, { desc = 'Package-info: Delete dependency on the line'})
	map({ "n" }, "<LEADER>ni", require("package-info").install, { desc = 'Package-info: Install a new dependency'})
	map({ "n" }, "<LEADER>np", require("package-info").change_version, { desc = 'Package-info: Install a different dependency version'})
end

return M
