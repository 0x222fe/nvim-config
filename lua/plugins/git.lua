return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gf", ":tab G<CR>", { desc = "[G]it [F]ugitive" })

			local Fugitive = vim.api.nvim_create_augroup("Fugitive", {})

			local autocmd = vim.api.nvim_create_autocmd
			autocmd("BufWinEnter", {
				group = Fugitive,
				pattern = "*",
				callback = function()
					if vim.bo.ft ~= "fugitive" then
						return
					end

					local bufnr = vim.api.nvim_get_current_buf()
					local opts = { buffer = bufnr, remap = false }
					vim.keymap.set("n", "<leader>p", function()
						vim.cmd.Git("push")
					end, opts)

					-- rebase always
					vim.keymap.set("n", "<leader>P", function()
						vim.cmd.Git({ "pull" })
					end, opts)
				end,
			})
			vim.keymap.set("n", "<leader>gd", vim.cmd.Gvdiff, { desc = "[G]it [D]iff" })
			vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { desc = "[G]it [M]erge" })

			vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
			vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
		end,
	},
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	config = function()
	-- 		require("diffview").setup()
	-- 		vim.keymap.set("n", "<leader>gd", vim.cmd.DiffviewOpen, { desc = "[G]it [D]iff" })
	-- 	end,
	-- },
}
