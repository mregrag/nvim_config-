-- Set leader key
-- General settings
vim.opt.mouse = "a"
vim.opt.termguicolors = true

-- Terminal size settings
local terminal_height = 15  -- Adjust this value for horizontal split height
local terminal_width = 80   -- Adjust this value for vertical split width

-- Key mappings for terminal management
-- Open terminal (bash) in horizontal split with fixed height
vim.keymap.set('n', '<leader>th', string.format(':botright %dsplit | terminal bash<CR>', terminal_height), { noremap = true, silent = true })

-- Open terminal (bash) in vertical split with fixed width
vim.keymap.set('n', '<leader>tv', string.format(':botright %dvsplit | terminal bash<CR>', terminal_width), { noremap = true, silent = true })

-- Open terminal (bash) in a new tab
vim.keymap.set('n', '<leader>tt', ':tabnew | terminal bash<CR>', { noremap = true, silent = true })

-- Close terminal (while in terminal mode)
vim.keymap.set('t', '<leader>tc', [[<C-\><C-n>:q!<CR>]], { noremap = true, silent = true })  -- Ctrl+C to close terminal

-- Allow Escape key to exit terminal mode
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true, silent = true })

-- Auto commands for terminal
vim.cmd [[
  autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
  
  " Prevent terminal buffer from being modified
  autocmd TermOpen * setlocal nobuflisted
]]

-- Optional: Force terminal window size after opening
