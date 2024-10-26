-- Function to run code in toggleterm
local function run_code()
    local filetype = vim.bo.filetype
    local full_filename = vim.fn.expand('%:p')      -- Full path
    local filename = vim.fn.expand('%:t')           -- File name with extension
    local basename = vim.fn.expand('%:t:r')         -- File name without extension
    local dir = vim.fn.expand('%:p:h')             -- Directory path
    local commands = {
        lua = 'lua ' .. full_filename,
        cpp = string.format('cd %s && g++ -std=c++98 -Wall -Wextra -Werror -g %s -o %s && ./%s',
            dir, filename, basename, basename),
        c = string.format('cd %s && cc -Wall -Wextra -Werror -g %s -o %s && ./%s',
            dir, filename, basename, basename),
        sh = 'bash ' .. full_filename,
    }
    local command = commands[filetype]
    if command then
        local Terminal = require('toggleterm.terminal').Terminal
        local runner = Terminal:new({
            cmd = command,
            direction = 'float',
            close_on_exit = false,
	    float_opts = {
                border = 'curved',
                width = 70,
                height = 20,
                winblend = 3,
            },
        })
        runner:toggle()
    else
        print("No run configuration for filetype: " .. filetype)
    end
end
vim.keymap.set('n', '<leader>r', run_code, { desc = 'Run in floating terminal' })
-----------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- Function to get program arguments from user
local function get_program_args()
    local args = vim.fn.input('Program arguments: ')
    return args
end

-- Function to find makefile directory
local function find_makefile_dir()
    local current_dir = vim.fn.expand('%:p:h')
    local path = current_dir
    while path ~= '/' do
        if vim.fn.filereadable(path .. '/Makefile') == 1 then
            return path
        end
        path = vim.fn.fnamemodify(path, ':h')
    end
    return nil
end

-- Run commands with arguments
vim.keymap.set('n', '<leader>ra', function()
    local file = vim.fn.expand('%:t:r')
    local args = get_program_args()
    local makefile_dir = find_makefile_dir()
    local cmd

    if makefile_dir then
        cmd = string.format('cd %s && ./%s %s', makefile_dir, file, args)
    else
        cmd = string.format('./%s %s', file, args)
    end

    local Terminal = require('toggleterm.terminal').Terminal
    local runner = Terminal:new({
        cmd = cmd,
        direction = 'float',
	float_opts = {
		border = 'curved',
		width = 70,
		height = 20,
		winblend = 3,
	},
        size = vim.o.columns * 0.4,
        close_on_exit = false,
        on_open = function(term)
            vim.cmd('startinsert!')
            print("Running: " .. cmd)
        end,
    })
    runner:toggle()
end, { desc = 'Run program with arguments' })
