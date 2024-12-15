vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
      vim.opt.mouse = "a"
  end,
})

vim.keymap.set("n", "<leader>th", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
end)

vim.keymap.set("n", "<leader>tv", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("L")
    vim.api.nvim_win_set_width(0, 50)
end)

