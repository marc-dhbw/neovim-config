-- Function to recursively find all C files and compile them with Zig
function CompileAndRunC()
	-- Save all current files
	vim.cmd("wa")
	-- Get the directory of the current file
	local current_dir = vim.fn.expand("%:p:h")

	-- Function to recursively collect all .c files
	local function find_c_files(dir)
		local c_files = {}

		-- Helper function to scan the directory
		local function scan_dir(directory)
			local entries = vim.fn.readdir(directory)
			for _, entry in ipairs(entries) do
				local full_path = directory .. "/" .. entry
				if vim.fn.isdirectory(full_path) == 1 then
					-- Recursively scan subdirectories
					scan_dir(full_path)
				elseif entry:match("%.c$") then
					table.insert(c_files, full_path)
				end
			end
		end

		scan_dir(dir)
		return c_files
	end

	-- Collect all .c files recursively starting from the current directory
	local c_files = find_c_files(current_dir)

	if #c_files == 0 then
		print("No C files found.")
		return
	end

	-- Create the output file path
	local output_file = current_dir .. "/a.exe"

	-- Create the compile command by joining all found C files
	local compile_command = "zig cc -o " .. output_file .. " " .. table.concat(c_files, " ")

	-- Run the compilation command
	vim.cmd("!" .. compile_command)

	-- Run the executable if the compilation is successful
	if vim.fn.filereadable(output_file) == 1 then
		vim.cmd("!" .. output_file)
	else
		print("Compilation failed.")
	end
end
