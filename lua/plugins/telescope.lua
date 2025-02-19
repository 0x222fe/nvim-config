return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "git")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>pf", function()
			builtin.find_files({
				cwd = vim.fn.getcwd(),
				hidden = true,
				no_ignore = true,
				file_ignore_patterns = {
					"%.o$",
					"%.so$",
					"%.bin$",
					"%.exe$",
					"%.class$",
					"%.dll$",
					"%.dat$",
					"%.pyc$",
					"%.pdb$",
				},
			})
		end, { desc = "[P]roject [F]iles" })

		vim.keymap.set("n", "<C-p>", function()
			builtin.git_files({ show_untracked = true })
		end)

		vim.keymap.set("n", "<leader>ps", function()
			builtin.live_grep()
		end, { desc = "[P]roject [S]earch" })

		vim.keymap.set("n", "<leader>vh", builtin.help_tags, { desc = "[V]view [H]elp" })

		vim.keymap.set("n", "<leader>gb", function()
			builtin.git_branches()
		end, { desc = "[G]it [B]ranches" })

		vim.keymap.set("n", "<leader>gc", function()
			builtin.git_commits()
		end, { desc = "[G]it [C]ommits" })

		vim.keymap.set("n", "<leader>gs", function()
			builtin.git_status()
		end, { desc = "[G]it [S]tatus" })

		vim.keymap.set("n", "<leader>gl", function()
			builtin.git_bcommits()
		end, { desc = "[G]it [L]og" })

		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		local layout = require("telescope.actions.layout")
		require("telescope").setup({
			defaults = {
				layout_config = {
					width = 0.95,
					horizontal = {
						preview_width = 0.75,
					},
				},
				path_display = {
					"truncate",
				},
				mappings = {
					i = {
						["<M-p>"] = layout.toggle_preview,
					},
					n = {
						["<M-p>"] = layout.toggle_preview,
					},
				},
			},
		})
	end,
}
