local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ('  %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, 'MoreMsg' })
	return newVirtText
end

return {
	{
		'kevinhwang91/nvim-ufo',
		event = { 'BufReadPost', 'BufNewFile' },
		dependencies = {
			'kevinhwang91/promise-async',
			'luukvbaal/statuscol.nvim'
		},
		keys = {
			{ '<space><space>', 'za', { desc = 'UFO: toggle fold' } },
			{ 'zR', function() require('ufo').openAllFolds() end, { desc = 'UFO: unfold all' } },
			{ 'zM', function() require('ufo').closeAllFolds() end, { desc = 'UFO: close all folds' } },
			{ 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end,
				{ desc = 'UFO: Peek folded lines under the cursor' } },
		},
		config = function()
			vim.opt.foldcolumn = '1'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true
			vim.opt.fillchars:append({ foldclose = '', foldopen = '›' })

			require('ufo').setup({
				fold_virt_text_handler = handler,
				provider_selector = function(_, _, _)
					return { 'treesitter', 'indent' }
				end
			})
		end
	},
	{
		'luukvbaal/statuscol.nvim',
		opts = function()
			local builtin = require('statuscol.builtin')
			return {
				relculright = true,
				segments = {
					{ text = { '%s' }, click = 'v:lua.ScSa' },
					{ text = { builtin.lnumfunc }, click = 'v:lua.ScLa' },
					{ text = { ' ', builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
				}
			}
		end
	}
}
