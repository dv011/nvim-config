local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp = require('lsp-zero').preset()

lsp.ensure_installed({
    'jdtls',
    'rust_analyzer',
    'lua_ls',
})

lsp.nvim_workspace()

vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
}, {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc="Jump to definition"}, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {desc="Show help in hover"}, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc="Workspace Symbols"}, opts)
    vim.keymap.set("n", "<leader>vdl", "<cmd>Telescope diagnostics<CR>", {desc="Telescope diagnostics list"}, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {desc="Floating window diagnostic"}, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc="Go to next diagnostic"}, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc="Go to previois diagnostic"}, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {desc="VIM LSP Code Actions"}, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, {desc="VIM LSP references"}, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc="VIM LSP rename"}, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc="VIM LSP signature help"}, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup{
    capabilities = capabilities,
    lsp.nvim_lua_ls(),
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

