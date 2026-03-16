return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").install({
            "vimdoc", "javascript", "c", "lua",
            "jsdoc", "bash", "python",
        })

        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("treesitter_config", { clear = true }),
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if not lang then return end
                pcall(vim.treesitter.start, args.buf, lang)
            end,
        })
    end
}
