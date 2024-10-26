vim.g.mapleader = " "
local keymap = vim.keymap -- for concisenes
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>m", ":make", { desc = "make c file" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
-- Add this keymapping to your config
vim.keymap.set('n', '<leader>rj', ':split | terminal node %<CR>', { noremap = true, silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- compiel and run c file
vim.keymap.set("n", "<leader>cc", ":!cc -Wall -Wextra -Werror % && ./a.out<CR>")
-- vim.keymap.set("n", "<leader>cc", ":!cc -Wall -Wextra -Werror %.c -o %:r && ./%:r")
-- compiel and run c++ file
vim.keymap.set("n", "<leader>cpp", ":!c++ -Wall -Wextra -Werror -std=c++98 % && ./a.out<CR>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>n", ":!norminette %<CR>")
vim.keymap.set("n", "<F1>", ":Stdheader<CR>")
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set("n", "<leader>nh", function() require("notify").history() end, { noremap = true, silent = true, desc = "Notification History" })


vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
