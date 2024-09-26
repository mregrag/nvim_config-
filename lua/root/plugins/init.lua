return {
    "nvim-lua/plenary.nvim", -- lua functions that many plugins use
    {
        "akinsho/toggleterm.nvim",
        config = function()
            local terminal = require("toggleterm")
            terminal.setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "horizontal",
                close_on_exit = true,
                autochdir = true,
                shell = vim.o.shell,
                width = 10,
                height = 10,
                winblend = 3,
                zindex = 20,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })
        end,
    },
}