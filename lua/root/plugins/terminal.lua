return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				shell = '$HOME/.local/bin/bash',
				direction = 'horizontal',
				shade_terminals = true,
				start_in_insert = true,
				insert_mappings = true,
				terminal_mappings = true,
				persist_size = true,
				close_on_exit = true,
			})

			-- Terminal keymaps
			function _G.set_terminal_keymaps()
				local opts = {buffer = 0}
				vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			end

			-- Auto-command to set terminal keymaps
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

			-- Key mappings focr toggleterm
			vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { noremap = true })
			vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { noremap = true })
			vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { noremap = true })
		end
	}
}
