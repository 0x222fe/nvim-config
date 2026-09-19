vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            -- checkOnSave = true,
            check = {
                enable = true,
                command = "clippy",
            },
            procMacro = {
                enable = true,
            },
            inlayHints = {
                typeHints = { enable = true },
                parameterHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
            },
        },
    },
})
