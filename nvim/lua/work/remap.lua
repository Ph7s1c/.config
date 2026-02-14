vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-Del>", "<Cmd>normal! \"_de<CR>", { noremap = true })

-- Macos Keybinds
vim.keymap.set({"i", "c"}, "<C-BS>", "<C-W>", { noremap = true })
vim.keymap.set({"i", "c"}, "<M-BS>", "<C-W>", { noremap = true })
-- Meta left/right arrow for word jumping (same as Control left/right)
vim.keymap.set({"i", "c", "n"}, "<M-Left>", "<C-Left>", { noremap = true })
vim.keymap.set({"i", "c", "n"}, "<M-Right>", "<C-Right>", { noremap = true })
vim.keymap.set({"i", "c", "n"}, "<M-Up>", "<Cmd>:m .-2<CR>", { noremap = true })
vim.keymap.set({"i", "c", "n"}, "<M-Down>", "<Cmd>:m .+1<CR>", { noremap = true })
vim.keymap.set({"i", "c", "n", "v"}, "<D-Left>", "<Cmd>normal! _<CR>", { noremap = true })
vim.keymap.set({"i", "c", "n", "v"}, "<D-Right>", "<Cmd>normal! $<CR>", { noremap = true })
vim.keymap.set({"i", "c"}, "<D-z>", "<Cmd>normal! u<CR>", { noremap = true })
vim.keymap.set({"i", "c"}, "<D-Z>", "<Cmd>normal! <C-r><CR>", { noremap = true })
vim.keymap.set({"i", "c"}, "<D-BS>", "<Cmd>normal! d0<CR>", { noremap = true })


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>Ca", "ggVG\"+y")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<C-6>", "<Cmd>b#<CR>", { noremap = true })
-- vim.keymap.set("n", "<leader>d", "<Cmd>bdelete<CR>")

-- Uncomment this to default off
-- vim.diagnostic.enable(false)
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>=", "m>gg=G'>")

vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true })

vim.keymap.set("n", "<leader>==", vim.lsp.buf.format)

vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })

vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { noremap = true })

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })

vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { noremap = true })

vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { noremap = true })

vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })

vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics<CR>", { noremap = true })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true })
