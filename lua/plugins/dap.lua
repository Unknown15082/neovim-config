return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},
		keys = {
			-- Breakpoints
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(
						vim.fn.input("Breakpoint condition: ")
					)
				end,
			},
			-- Actions
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			-- General
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				desc = "Toggle REPL",
			},
		},
		config = function()
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Toggle DAP UI",
			},
			{
				"<leader>de",
				function()
					require("dapui").eval()
				end,
				desc = "DAP Evaluate",
				mode = { "n", "v" },
			}
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			ensure_installed = {
				-- C++
				"codelldb",
				-- Python
				"python",
				-- Go
				"delve",
			},
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,

				-- codelldb (C/C++/Rust)
				codelldb = function(config)
					local mason_registry = require("mason-registry")
					local codelldb_path = mason_registry.get_package("codelldb"):get_install_path()
					config.adapters = {
						type = "server",
						port = "${port}",
						executable = {
							command = codelldb_path .. "/codelldb",
							args = {
								"--port",
								"${port}",
							},
						},
					}

					if vim.fn.has("win32") == 1 then
						config.adapters.executable.detached = false
					end

					local extra_configurations = {
						{
							stdio = { vim.env.inputfile, vim.env.outputfile, nil },
						},
					}

					config.configurations = vim.tbl_deep_extend(
						"force",
						config.configurations,
						extra_configurations
					)

					require("mason-nvim-dap").default_setup(config)
				end,
			}
		},
	},
}
