return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "j-hui/fidget.nvim",
    },
    config = function()
        local mason = require("mason")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
        
        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "html",
                "pyright",
            },
            automatic_installation = true,
        })
        
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        require("fidget").setup({})
        
        -- Use the handler setup approach
        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "html", 
                "pyright",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = cmp_lsp.default_capabilities(),
                    })
                end,
            }
        })
    end,
}
