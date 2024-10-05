-- Lazy.nvim plugin setup for tmux integration
return {
	-- Tmux navigator: easily move between tmux panes and Neovim splits
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		config = function()
			-- Enable seamless navigation between Neovim and tmux
			vim.g.tmux_navigator_no_mappings = 1  -- Disable default mappings
		end
	},

	-- Optional: You can add more tmux-related plugins here
	{
		'akinsho/toggleterm.nvim',
	},

	-- Additional configuration for better user experience can go here
	{
		"nvim-lua/plenary.nvim",  -- Required for other plugins or functionalities
	}
}

