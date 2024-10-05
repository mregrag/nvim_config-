return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/tmp", "~/Desktop" },
			auto_session_enable_last_session = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,

			session_lens = {
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
		})
		local function delete_all_sessions()
			local session_dir = vim.fn.stdpath("data") .. "/sessions/"
			local handle = vim.loop.fs_scandir(session_dir)
			if handle then
				while true do
					local name, type = vim.loop.fs_scandir_next(handle)
					if not name then break end
					if type == "file" then
						vim.fn.delete(session_dir .. name)
					end
				end
				print("All sessions deleted.")
			else
				print("No sessions found.")
			end
		end
		local function create_named_session()
			local session_name = vim.fn.input("Enter session name: ")
			if session_name ~= "" then
				vim.cmd("SessionSave " .. session_name)
			else
				print("Session name cannot be empty.")
			end
		end

		vim.api.nvim_create_user_command("SessionDeleteAll", delete_all_sessions, {})
		vim.api.nvim_create_user_command("SessionSaveNamed", create_named_session, {})
		local keymap = vim.keymap
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
		keymap.set("n", "<leader>sn", "<cmd>SessionSaveNamed<CR>", { desc = "Create new named session" })
		keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session" })
		keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete session" })
		keymap.set("n", "<leader>sf", "<cmd>Autosession search<CR>", { desc = "Find sessions" })
		keymap.set("n", "<leader>sD", "<cmd>SessionDeleteAll<CR>", { desc = "Delete all sessions" })
	end,
}
