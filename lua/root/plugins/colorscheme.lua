return {
    'navarasu/onedark.nvim', -- Plugin for One Dark theme
    priority = 1000,
    config = function()
	require("onedark").setup({
	    style = "darker", -- Choose from 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
	    transparent = true, -- Enable transparency
	    term_colors = true, -- Apply colors in terminal
	    ending_tildes = true, -- Show tildes at the end of the buffer

	    colors = {
		bg = "#282c34",       -- Background color
		fg = "#abb2bf",       -- Default text color
		red = "#e06c75",
		green = "#98c379",
		yellow = "#e5c07b",
		blue = "#61afef",
		purple = "#c678dd",
		cyan = "#56b6c2",
		white = "#abb2bf",
		black = "#282c34",
		-- Add more custom colors as needed
	    },
	    code_style = {
		comments = 'italic',
		keywords = 'none',
		functions = 'none',
		strings = 'italic',
		variables = 'none'
	    },

	    -- Override specific highlight groups
	    highlights = {
		Comment = { fg = "#5c6370", italic = true },
		Function = { fg = "#61afef", bold = true },
		Keyword = { fg = "#c678dd", bold = true },
		String = { fg = "#98c379", italic = true },
		-- Add additional highlight group overrides here
	    },
	    -- Plugins Config --
	    diagnostics = {
		darker = true, -- darker colors for diagnostic
		undercurl = true,   -- use undercurl instead of underline for diagnostics
		background = true,    -- use background color for virtual text
	    },
	})

	require("onedark").load() -- Load the theme
    end,
}
