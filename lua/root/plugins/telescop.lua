return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim",
	{"nvim-telescope/telescope-fzf-native.nvim", build = "cmake"},
	"nvim-tree/nvim-web-devicons",
    },
    config = function()
	-- set keymaps
	local builtin = require('telescope.builtin')

	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep)
	vim.keymap.set("n", "<leader>fs", builtin.grep_string)
	vim.keymap.set("n", "<leader>fh", builtin.help_tags)
	vim.keymap.set("n", "<leader>nv", function () builtin.find_files{cwd = vim.fn.stdpath("config")} end)
	vim.keymap.set("n", "<leader>fh", function () builtin.find_files{cwd = vim.fn.expand("~/"), hidden = true} end)
    end,
}
