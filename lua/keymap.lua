vim.g.mapleader = " "

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostic" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>rl", "<CMD>LspRestart<CR>", { desc = "[R]estart [L]SP" })
vim.keymap.set("n", "<leader>rf", "<CMD>e!<CR>", { desc = "[R]eload current [F]ile" })

vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<S-CR>", "<Nop>")
vim.keymap.set({ "n" }, "<CR>", "<Nop>")


vim.keymap.set("n", "<leader>ee", function()
  local lines = {
    "if err != nil {",
    "return err",
    "}",
  }
  local curr_line = vim.api.nvim_get_current_line()
  if curr_line:match("^%s*$") then
    vim.api.nvim_buf_set_lines(0, vim.fn.line(".") - 1, vim.fn.line("."), false, lines)
    vim.cmd("normal! j$")
  else
    vim.api.nvim_put(lines, "l", true, true)
    vim.cmd("normal! 2k$")
  end
  vim.lsp.buf.format({ async = true })
end, { desc = "Insert if err != nil check" })