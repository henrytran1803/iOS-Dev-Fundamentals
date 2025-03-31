return {
	-- LSP cho Dart
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				dartls = {}, -- Dart Language Server
			},
		},
	},

	-- Plugin hỗ trợ Flutter
	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
		config = function()
			require("flutter-tools").setup({
				lsp = {
					on_attach = function(client, bufnr)
						require("lazyvim.util").lsp.on_attach(client, bufnr)
					end,
				},
			})
		end,
	},

	-- Treesitter cho Dart
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = { "dart" },
		},
	},

	-- Debugging với nvim-dap
	{
		"mfussenegger/nvim-dap",
		dependencies = { "leoluz/nvim-dap-go" },
		config = function()
			require("dap").adapters.dart = {
				type = "executable",
				command = "dart",
				args = { "debug_adapter" },
			}
			require("dap").configurations.dart = {
				{
					type = "dart",
					request = "launch",
					name = "Launch Flutter",
					program = "${workspaceFolder}/lib/main.dart",
					cwd = "${workspaceFolder}",
				},
			}
		end,
	},
}
