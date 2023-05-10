return {
	'huggingface/hfcc.nvim',
	version = false,
	cmd = 'HFccSuggestion',
	opts = {
		api_token = os.getenv('HUGGINGFACE'),
		model = 'https://huggingface.co/bigcode/starcoder'
	},
	keys = {
		{ '<leader>hcc', ':HFccSuggestion<cr>', desc = '[HFCC] show suggestion' }
	}
}
