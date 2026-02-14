vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff=5
vim.opt.sidescrolloff=8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.colorcolumn = "80"

vim.o.guicursor = "a:ver100"

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--
-- vim.opt.foldcolumn = "0"

vim.opt.foldtext = ""

-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')
-- require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({ path = { "./snippets" } })

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() or has_words_before() then
                cmp.complete()
                cmp.confirm({ select = true })
                cmp.core:reset()
            else
                fallback()
            end
        end, {"i","s"}),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                -- fallback()
            end
        end, {"i","s"}),
        ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                -- fallback()
            end
        end, {"i","s"}),
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
        ["<C-Space>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
                cmp.core:reset() --comment this out when the maintainer fixes
            else
                cmp.complete()
            end
        end, {"i","s"}),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
                cmp.core:reset() --comment this out when the maintainer fixes
            else
                fallback()
            end
        end, {"i","s"}),
    },
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    completion = {
        autocomplete = false,
    },
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'calc' },
    }, {
        { name = 'path',
          option = {
            trailing_slash = true},
        },
    }
    -- , {
    --     { name = 'nvim_lsp' },
    -- }
    )
})

-- vim.diagnostic.config({
--     -- update_in_insert = true,
--     float = {
--         focusable = false,
--         style = "minimal",
--         border = "rounded",
--         source = "always",
--         header = "",
--         prefix = "",
--     },
-- })

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "Normal" })
vim.api.nvim_set_hl(0, "HarpoonActive", { foreground = "#B0BBBB", background = "#1f2329" })
vim.api.nvim_set_hl(0, "HarpoonInactive", { link = "TabLine" })
vim.api.nvim_set_hl(0, "HarpoonNumberActive", { link = "HarpoonActive" })
vim.api.nvim_set_hl(0, "HarpoonNumberInactive", { link = "TabLine" })


-- vim.fn.sign_define('DiagnosticSignError', { text = '' })
-- vim.fn.sign_define('DiagnosticSignWarn', { text = '' })
-- vim.fn.sign_define('DiagnosticSignInfo', { text = '' })
-- vim.fn.sign_define('DiagnosticSignHint', { text = '' })

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    },
    virtual_text = {
        true
    },
})
