-- Neo-tree setup configuration
require("neo-tree").setup({
	close_if_last_window = true, -- Automatically close Neo-tree if it's the last window open
	enable_git_status = true, -- Show git status (like modified, added, etc.) next to files
	enable_diagnostics = true, -- Show diagnostics (like errors or warnings) in the file tree
	window = {
		position = "left", -- Position of the file tree window (can be 'left', 'right', etc.)
		width = 30, -- Width of the file tree window
		mappings = { -- Key mappings for interacting with the file tree
			["<space>"] = "toggle_node", -- Toggle opening/closing directories
			["<cr>"] = "open", -- Open file or directory
			["S"] = "open_split", -- Open file in a horizontal split
			["s"] = "open_vsplit", -- Open file in a vertical split
			["t"] = "open_tabnew", -- Open file in a new tab
			["C"] = "close_node", -- Close directory
			["a"] = "add", -- Add a new file
			["A"] = "add_directory", -- Add a new directory
			["d"] = "delete", -- Delete a file or directory
			["r"] = "rename", -- Rename a file or directory
			["y"] = "copy_to_clipboard", -- Copy file or directory name to clipboard
			["x"] = "cut_to_clipboard", -- Cut file or directory name to clipboard
			["p"] = "paste_from_clipboard", -- Paste file or directory from clipboard
			["c"] = "copy", -- Copy file or directory
			["m"] = "move", -- Move file or directory
			["q"] = "close_window", -- Close the Neo-tree window
		},
	},
	filesystem = {
		follow_current_file = true, -- Automatically find and focus the file in the current buffer
		filtered_items = {
			visible = false, -- Don't show hidden files by default
			hide_dotfiles = true, -- Hide dotfiles (files starting with .)
			hide_gitignored = true, -- Hide files ignored by Git
		},
	},
})

-- Keybinding to toggle Neo-tree
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })
