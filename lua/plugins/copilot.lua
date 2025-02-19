return {
	"github/copilot.vim",
	config = function()
		vim.keymap.set("n", "<leader>tc", function()
			local current = vim.fn.execute("Copilot status")

			if current:match("Ready") then
				vim.cmd("Copilot disable")
				print("Copilot: Disabled")
			else
				vim.cmd("Copilot enable")
				print("Copilot: Enabled")
			end
		end, { desc = "[T]oggle [C]opilot" })
	end,
}
