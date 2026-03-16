return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc", "javascript", "c", "lua",
                "jsdoc", "bash", "python",
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end
}
