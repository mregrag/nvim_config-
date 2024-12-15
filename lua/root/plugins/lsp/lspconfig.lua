return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
	"hrsh7th/cmp-nvim-lsp",
	{ "antosha417/nvim-lsp-file-operations", config = true },
	{ "folke/neodev.nvim", opts = {} },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"prettier/vim-prettier",
    },
    config = function()
	-- import lspconfig plugin
	local lspconfig = require("lspconfig")

	-- import cmp-nvim-lsp plugin
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	-- import mason plugin
	local mason = require("mason")

	-- import mason-lspconfig plugin
	local mason_lspconfig = require("mason-lspconfig")

	-- enable mason
	mason.setup()

	mason_lspconfig.setup({
	    -- list of servers for mason to install
	    ensure_installed = {"clangd","lua_ls"},
	    -- auto-install configured servers (with lspconfig)
	    automatic_installation = true, -- not the same as ensure_installed
	})
	-- Diagnostic symbols
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
	    local hl = "DiagnosticSign" .. type
	    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local opts = { noremap = true, silent = true }
	local on_attach = function(client, bufnr)
	    opts.buffer = bufnr
	    -- set keybinds
	    opts.desc = "Show LSP references"
	    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

	    opts.desc = "Go to declaration"
	    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

	    opts.desc = "Show LSP definitions"
	    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

	    opts.desc = "Show LSP implementations"
	    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

	    opts.desc = "Show LSP type definitions"
	    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

	    opts.desc = "See available code actions"
	    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

	    opts.desc = "Smart rename"
	    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	    opts.desc = "Show buffer diagnostics"
	    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	    opts.desc = "Show line diagnostics"
	    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

	    opts.desc = "Go to previous diagnostic"
	    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

	    opts.desc = "Go to next diagnostic"
	    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

	    opts.desc = "Show documentation for what is under cursor"
	    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	    opts.desc = "Restart LSP"
	    vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
	    capabilities = capabilities,
	    on_attach = on_attach,
	})

	-- configure clangd for C/C++
	lspconfig["clangd"].setup({
	    capabilities = capabilities,
	    on_attach = on_attach,
	    })
	end,
    }
