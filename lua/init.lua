require("set")
require("keymap")
require("lazy_init")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_augroup("netrw_settings", { clear = true })

local function execute_in_netrw_dir()
	local current_dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
	local cmd = vim.fn.input("Shell command: ")
	if cmd ~= "" then
		vim.cmd("new")

		vim.opt_local.buftype = "nofile"
		vim.opt_local.bufhidden = "wipe"
		vim.opt_local.swapfile = false

		local output = vim.fn.system(string.format("cd %s && %s", vim.fn.shellescape(current_dir), cmd))
		vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))

		vim.opt_local.modified = false
		vim.opt_local.readonly = true
		vim.opt_local.modifiable = false

		vim.keymap.set("n", "<CR>", ":close<CR>", { buffer = true, silent = true })
		vim.keymap.set("n", "q", ":close<CR>", { buffer = true, silent = true })
	end
end

vim.keymap.set("n", "<leader>!", execute_in_netrw_dir, { desc = "Execute in current directory" })
