-- Basic quickfix list keymaps
vim.keymap.set('n', '<leader>qf', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>qc', ':cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', '<leader>qn', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>qp', ':cprev<CR>', { desc = 'Previous quickfix item' })

-- Function to add current file to quickfix list
vim.keymap.set('n', '<leader>qa', function()
    local current_file = vim.fn.expand('%:p')
    local qf_list = vim.fn.getqflist()
    -- Create entry for current file
    local new_entry = {
        filename = current_file,
        lnum = vim.fn.line('.'),
        col = vim.fn.col('.'),
        text = vim.fn.getline('.')
    }
    -- Add to existing quickfix list
    table.insert(qf_list, new_entry)
    vim.fn.setqflist(qf_list)
    print("Added " .. current_file .. " to quickfix list")
end, { desc = 'Add current file to quickfix list' })

-- Optional: Function to clear quickfix list
vim.keymap.set('n', '<leader>qx', function()
    vim.fn.setqflist({})
    print("Cleared quickfix list")
end, { desc = 'Clear quickfix list' })
