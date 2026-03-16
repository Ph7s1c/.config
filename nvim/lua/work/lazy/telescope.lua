return {
    "nvim-telescope/telescope.nvim",

    branch = "0.1.x",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                preview = {
                    treesitter = false,
                },
            },
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fh', function() builtin.find_files({ hidden = true }) end, { desc = 'Find files (including hidden)' })
        vim.keymap.set('n', '<leader>fi', function() builtin.find_files({ hidden = true, no_ignore = true }) end, { desc = 'Find files (hidden + ignored)' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
        vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = 'Find command history' })
        vim.keymap.set('n', '<leader>fH', builtin.help_tags, { desc = 'Find help tags' })
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git commits' })
        vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
	
    end
}
