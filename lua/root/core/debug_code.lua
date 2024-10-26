local debug_commands = {
	cpp = function()
		local file = vim.fn.expand('%:p:r')  -- Gets absolute path without extension
		local dir = vim.fn.expand('%:p:h')   -- Gets directory of current file
		return string.format('cd %s && lldb ./%s', dir, vim.fn.fnamemodify(file, ':t'))
	end,
	c = function()
		local file = vim.fn.expand('%:p:r')  -- Gets absolute path without extension
		local dir = vim.fn.expand('%:p:h')   -- Gets directory of current file
		return string.format('cd %s && lldb ./%s', dir, vim.fn.fnamemodify(file, ':t'))
	end,
}

vim.keymap.set('n', '<leader>db', function()
	local filetype = vim.bo.filetype
	local command = debug_commands[filetype]
	if command then
		local Terminal = require('toggleterm.terminal').Terminal
		local debugger = Terminal:new({
			cmd = command(),  -- Call the function to get the command
			direction = 'vertical',
			size = vim.o.columns * 0.4,
			float_opts = {
				border = 'double',
				width = 50,
				height = 20,
				winblend = 3,
			},
			close_on_exit = false,
			on_open = function(term)
				vim.cmd('startinsert!')
			end,
		})
		debugger:toggle()
	else
		print("No debug configuration for filetype: " .. filetype)
	end
end, { desc = 'Debug current file in terminal' })
