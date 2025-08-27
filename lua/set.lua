vim.api.nvim_create_user_command("W", "w", {})

vim.g.have_nerd_font = true

vim.opt.number = true -- Show absolute line number for the current line
vim.opt.relativenumber = true -- Enable relative line numbers

vim.opt.mouse = "a"
vim.opt.showmode = false

vim.opt.undofile = true

vim.opt.tabstop = 4 -- Number of spaces for a tab
vim.opt.softtabstop = 4 -- Number of spaces for a tab in insert mode
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.expandtab = true -- Convert tabs to spaces

vim.opt.smartindent = true -- Enable smart indentation based on syntax

vim.opt.wrap = true -- Line wrapping

vim.opt.hlsearch = false -- Disable search result highlighting
vim.opt.incsearch = true -- Enable incremental search

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true -- Enable true color support in the terminal

vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 10 -- Keep x lines visible above and below the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column to prevent text shifting

vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.updatetime = 50 -- Reduce time for triggering swap writes and CursorHold

vim.opt.colorcolumn = "110" -- Highlight the x-th column to maintain line length limits

vim.cmd([[highlight LineNr term=bold cterm=bold ctermfg=Yellow guifg=Yellow]])
vim.cmd([[highlight CursorLineNr term=bold cterm=bold ctermfg=Yellow guifg=Yellow]])

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

if vim.env.TMUX ~= nil then
	local copy = { "tmux", "load-buffer", "-w", "-" }
	local paste = { "bash", "-c", "tmux refresh-client -l && sleep 0.05 && tmux save-buffer -" }
	vim.g.clipboard = {
		name = "tmux",
		copy = {
			["+"] = copy,
			["*"] = copy,
		},
		paste = {
			["+"] = paste,
			["*"] = paste,
		},
		cache_enabled = 0,
	}
else
	vim.g.clipboard = {
		name = "OSC 52",
		copy = {
			["+"] = require("vim.ui.clipboard.osc52").copy("+"),
			["*"] = require("vim.ui.clipboard.osc52").copy("*"),
		},
		paste = {
			["+"] = require("vim.ui.clipboard.osc52").paste("+"),
			["*"] = require("vim.ui.clipboard.osc52").paste("*"),
		},
	}
end
