return {
    {
        'rktjmp/lush.nvim',
        -- You can set the priority here if needed
    },
    {
        'uloco/bluloco.nvim',
        priority = 1000, -- Ensure this loads before other plugins
        config = function()
            -- Configure the Bluloco theme
            require('bluloco').setup {
                style = 'dark', -- Choose between 'dark' or 'light'
                transparent = true, -- Set to true for a transparent background
                transparent_background = true, -- Enable transparent background
                styles = {
                    comments = 'italic', -- Set comments style
                    keywords = 'bold',    -- Set keywords style
                    functions = 'none',   -- No special style for functions
                    strings = 'none',     -- No special style for strings
                    variables = 'none',    -- No special style for variables
                },
                -- Additional custom options can go here
                diagnostics = {
                    darker = true, -- Darker colors for diagnostics
                    undercurl = true, -- Use undercurl instead of underline for diagnostics
                    background = true, -- Use background color for virtual text
                },
            }

            -- Set the colorscheme
            vim.cmd('colorscheme bluloco')
            -- vim.o.background = 'dark' -- Set the background to dark
        end,
    },
}
