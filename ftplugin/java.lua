local jdtls = require("jdtls")
local home = os.getenv("HOME")
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"

-- Find root directory
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then
    return
end

-- Project specific workspace
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

-- Determine OS specific configuration
local os_config
if vim.fn.has("mac") == 1 then
    os_config = "config_mac"
elseif vim.fn.has("unix") == 1 then
    os_config = "config_linux"
else
    os_config = "config_win"
end

-- The command that starts the language server

local cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    -- The JDTLS launcher - automatically finds the correct jar in the Mason installation
    "-jar",
    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),

    -- JDTLS config from Mason installation
    "-configuration",
    jdtls_path .. "/" .. os_config,

    -- Project workspace
    "-data",
    workspace_dir,
}

-- Main configuration
local config = {
    cmd = cmd,
    root_dir = root_dir,
    settings = {
        java = {
            runtimes = {
                {
                    name = "JavaSE-17",
                    path = "/usr/lib/jvm/java-17-openjdk-amd64",
                },
                {
                    name = "JavaSE-21",
                    path = "/usr/lib/jvm/java-21-openjdk-amd64",
                },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.junit.Assert.*",
                    "org.junit.Assume.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*",
                },
            },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
        },
    },

    -- Basic initialization options
    init_options = {
        bundles = {},
    },
}

-- Start the server
jdtls.start_or_attach(config)

-- Set up Java-specific keymaps
vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, { buffer = true, desc = "Organize Imports" })
vim.keymap.set("n", "<leader>jt", jdtls.test_class, { buffer = true, desc = "Test Class" })
vim.keymap.set("n", "<leader>jn", jdtls.test_nearest_method, { buffer = true, desc = "Test Nearest Method" })
vim.keymap.set("v", "<leader>jem", function()
    jdtls.extract_method(true)
end, { buffer = true, desc = "Extract Method" })
