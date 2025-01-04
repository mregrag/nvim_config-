-- Create an autocmd group for terminal settings
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
      vim.opt.mouse = "a"
  end,
})

-- Function to open a terminal in a new horizontal split
local function open_horizontal_terminal()
    vim.cmd('split')  -- Open a new horizontal split
    vim.cmd('term')   -- Open terminal in the new split
    vim.cmd('wincmd J') -- Move the split to the bottom
    vim.api.nvim_win_set_height(0, 15) -- Set the height of the terminal split
end

-- Function to open a terminal in a new vertical split
local function open_vertical_terminal()
    vim.cmd('vsplit') -- Open a new vertical split
    vim.cmd('term')   -- Open terminal in the new split
    vim.cmd('wincmd L') -- Move the split to the right
    vim.api.nvim_win_set_width(0, 50) -- Set the width of the terminal split
end

-- Key mappings to open terminals in horizontal and vertical splits
vim.keymap.set("n", "<leader>th", open_horizontal_terminal, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tv", open_vertical_terminal, { noremap = true, silent = true })

-- Key mapping to exit terminal mode with 'jk'
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Key mapping to create additional terminal splits
vim.keymap.set("n", "<leader>tH", function()
    vim.cmd('split')  -- Open a new horizontal split
    vim.cmd('term')   -- Open terminal in the new split
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tV", function()
    vim.cmd('vsplit') -- Open a new vertical split
    vim.cmd('term')   -- Open terminal in the new split
end, { noremap = true, silent = true })
