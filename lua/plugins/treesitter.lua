return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- for nvim 0.12+
    build = ":TSUpdate",
    opts = {
        install_dir = vim.fn.stdpath("data") .. "/site",
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
        require("nvim-treesitter").install({
            "bash",
            "c",
            "cpp",
            "c_sharp",
            "diff",
            "go",
            "html",
            "java",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "query",
            "vim",
            "vimdoc",
            "vue",
            "javascript",
            "typescript",
            "rust",
            "xml",
            "dockerfile",
            "sql",
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
