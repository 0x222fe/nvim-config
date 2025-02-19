return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
		-- local conf = require('telescope.config').values
		-- local function toggle_telescope(harpoon_files)
		--   local file_paths = {}
		--   for _, item in ipairs(harpoon_files.items) do
		--     table.insert(file_paths, item.value)
		--   end
		--
		--   require('telescope.pickers')
		--     .new({}, {
		--       prompt_title = 'Harpoon',
		--       finder = require('telescope.finders').new_table {
		--         results = file_paths,
		--       },
		--       previewer = conf.file_previewer {},
		--       sorter = conf.generic_sorter {},
		--     })
		--     :find()
		-- end

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		-- vim.keymap.set('n', '<C-h>', function()
		--   toggle_telescope(harpoon:list())
		-- end, { desc = 'Open harpoon window' })

		vim.keymap.set("n", "<leader>ja", function()
			harpoon:list():add()
		end, { desc = "Harpoon [A]dd" })

		vim.keymap.set("n", "<leader>jd", function()
			harpoon:list():remove()
		end, { desc = "Harpoon [D]elete" })

		vim.keymap.set("n", "<leader>jh", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon [J]ump 1" })
		vim.keymap.set("n", "<leader>jj", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon [J]ump 2" })
		vim.keymap.set("n", "<leader>jk", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon [J]ump 3" })
		vim.keymap.set("n", "<leader>jl", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon [J]ump 4" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-N>", function()
			harpoon:list():next()
		end)
	end,
}
