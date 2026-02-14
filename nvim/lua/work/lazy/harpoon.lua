return {
    {"theprimeagen/harpoon",
    branch="harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            --global_settings = {
            --    tabline = true,
            --},
            menu = { width = vim.api.nvim_win_get_width(0) - 4 },
            })
        require('harpoon-tabline').setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
        vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
        vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
        vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)
    end},
    {
        "jasonpanosso/harpoon-tabline.nvim",
        dependencies = { "ThePrimeagen/harpoon" },
        config = function()
            require('harpoon-tabline').setup({
                use_editor_color_scheme = false,
            })

            vim.api.nvim_set_hl(0, "HarpoonActive", { foreground = "#B0BBBB", background = "#1f2329" })
            vim.api.nvim_set_hl(0, "HarpoonInactive", { link = "TabLine" })
            vim.api.nvim_set_hl(0, "HarpoonNumberActive", { link = "HarpoonActive" })
            vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { link = "TabLine" })
        end
    }
}
