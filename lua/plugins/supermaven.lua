return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		-- require("cmp").setup({
		-- 	sources = {
		--
		-- 		{ name = "supermaven" },
		-- 	},
		-- 	-- experimental = {
		-- 	-- 	ghost_text = {
		-- 	-- 		hls_group = "CmpGhostText",
		-- 	-- 	},
		-- 	-- },
		-- })

		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			ignore_filetypes = {}, -- or { "cpp", }
			color = {
				suggestion_color = "#ffffff",
				cterm = 244,
			},
			log_level = "info", -- set to "off" to disable logging completely
			-- disable_inline_completion = false, -- disables inline completion for use with cmp
			-- disable_keymaps = false, -- disables built in keymaps for more manual control
			condition = function()
				return false
			end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
		})

		vim.keymap.set("n", "<leader>ts", function()
			local api = require("supermaven-nvim.api")
			api.toggle()
		end, { desc = "[T]oggle [S]upermaven" })
	end,
}
