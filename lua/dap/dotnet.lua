return {
	"Samsung/netcoredbg",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")

		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.expand("~/.dotnet/netcoredbg/netcoredbg"),
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				program = function()
					local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

					vim.notify("Building project...", vim.log.levels.INFO)
					local build_result = vim.fn.system("dotnet build")

					if vim.v.shell_error ~= 0 then
						vim.notify("Build failed:\n" .. build_result, vim.log.levels.ERROR)
						return nil
					end

					local tf_cmd = string.format("cat %s.csproj | grep TargetFramework", project_name)
					local tf = vim.fn.system(tf_cmd)
					local version = tf:match("net(%d+%.%d+)")

					local default_path =
						string.format("%s/bin/Debug/net%s/%s.dll", vim.fn.getcwd(), version, project_name)

					if vim.fn.filereadable(default_path) ~= 1 then
						vim.notify("Built dll not found at: " .. default_path, vim.log.levels.ERROR)
						return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					end

					return default_path
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
				console = "integratedTerminal",
				justMyCode = true,
				env = {
					ASPNETCORE_ENVIRONMENT = "Development",
				},
			},
		}
	end,
}
