return {
	'akinsho/toggleterm.nvim',
	config = function()
		require("toggleterm").setup{
			-- size can be a number or function which is passed the current terminal
			open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
			shade_filetypes = {},
			autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE this is only a subset of values, any group placed here will be set for the terminal window split
				Normal = {
					guibg = "#000005",
				},
				NormalFloat = {
					link = 'Normal'
				},
				--BUG:
				--TEST:
				--INFO:
				FloatBorder = {
					guifg = "#00000A",
					guibg = "#000014",
				},
			},
			shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			shading_factor = 0.2, -- the percentage by which to lighten dark terminal background, default: -30 (converted to decimal)
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = 'horizontal',
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell,
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			-- This field is only relevant if direction is set to 'float'
		}
		function _G.set_terminal_keymaps()
			local opts = {buffer = 0}
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
		end
		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

	end
}
