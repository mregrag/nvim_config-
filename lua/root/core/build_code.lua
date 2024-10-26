-- Optional: Add compilation commands for specific filetypes
vim.keymap.set('n', '<leader>b', function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%')
    local compile_commands = {
        cpp = 'g++ -Wall -Wextra -Werror -g ' .. filename .. ' -o ' .. vim.fn.expand('%:r'),
        c = 'cc -Wall -Wextra -Werror -g ' .. filename .. ' -o ' .. vim.fn.expand('%:r'),
    }
    local command = compile_commands[filetype]
    if command then
        vim.cmd('!' .. command)
    else
        print("No compile configuration for filetype: " .. filetype)
    end
end, { desc = 'Compile current file' })

