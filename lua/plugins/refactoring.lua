return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
        require("refactoring").setup({
            -- prompt_func_return_type = {
            --     go = false,
            --     java = false,
            --
            --     cpp = false,
            --     c = false,
            --     h = false,
            --     hpp = false,
            --     cxx = false,
            -- },
            -- prompt_func_param_type = {
            --     go = false,
            --     java = false,
            --
            --     cpp = false,
            --     c = false,
            --     h = false,
            --     hpp = false,
            --     cxx = false,
            -- },
            -- printf_statements = {},
            -- print_var_statements = {},
            -- show_success_message = false, -- shows a message with information about the refactor on success
            --                               -- i.e. [Refactor] Inlined 3 variable occurrences
        })

        -- vim.keymap.set('x', '<leader>cre', ":Refactor extract ", {  desc = "[C]ode [R]efactor [E]xtract" })
        -- vim.keymap.set('x', '<leader>crb' ,":Refactor extract_block", { desc = "[C]ode [R]efactor extract [B]lock" })

        vim.keymap.set({ "n", "x" }, "<leader>crf", function()
            return require("refactoring").refactor("Extract Function")
        end, { expr = true, desc = "[C]ode [R]efactor extract [F]unction" })
        -- vim.keymap.set({ "n", "x" }, "<leader>rf", function() return require('refactoring').refactor('Extract Function To File') end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>crv", function()
            return require("refactoring").refactor("Extract Variable")
        end, { expr = true, desc = "[C]ode [R]efactor extract [V]ariable" })
        -- vim.keymap.set({ "n", "x" }, "<leader>rI", function() return require('refactoring').refactor('Inline Function') end, { expr = true })
        -- vim.keymap.set({ "n", "x" }, "<leader>ri", function() return require('refactoring').refactor('Inline Variable') end, { expr = true })
        vim.keymap.set({ "n", "x" }, "<leader>crb", function()
            return require("refactoring").refactor("Extract Block")
        end, { expr = true, desc = "[C]ode [R]efactor extract [B]lock" })
        -- vim.keymap.set({ "n", "x" }, "<leader>rbf", function() return require('refactoring').refactor('Extract Block To File') end, { expr = true })
    end,
}
