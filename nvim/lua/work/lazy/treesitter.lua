return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local install = require("nvim-treesitter.install")

        install.install({
            "vimdoc", "javascript", "c", "lua",
            "jsdoc", "bash", "python",
        })

        local group = vim.api.nvim_create_augroup("treesitter_config", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            callback = function(args)
                local ft = vim.bo[args.buf].filetype
                local lang = vim.treesitter.language.get_lang(ft)
                if not lang then return end

                local supported = require("nvim-treesitter.parsers")
                if supported[lang] and not pcall(vim.treesitter.get_parser, args.buf, lang) then
                    install.install({ lang })
                end

                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                if ft == "markdown" then
                    vim.bo[args.buf].syntax = "on"
                end
            end,
        })
    end
}
