local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

-- Function to get current time
local function current_time()
	return os.date("%H:%M:%S") -- Formats time as HH:MM:SS
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "nord",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = {
			"progress",
		},
		lualine_z = {
			"location", -- Shows current line and column number
			current_time, -- Adds the time function here
		},
	},
	tabline = {},
	extensions = {},
})
