local lsp_zero = require('lsp-zero')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
  
cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer'},
    },
    mapping = cmp.mapping.preset.insert{
        ["<C-Space>"] = cmp.mapping.complete(),
        --true
        --['<CR>'] = cmp.mapping.confirm({select = false}),
        ['<Tab>'] = cmp.mapping.confirm({select = false}),
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    },
    formatting = cmp_format,
})

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        remap = false
    })

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})
lsp_zero.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'csharp_ls', 'html', 'tailwindcss', 'jsonls'},
    handlers = {
        lsp_zero.default_setup,
    },
})

require('lspconfig').csharp_ls.setup{
    on_attach = on_attach
}
vim.diagnostic.config({
    virtual_text = true
})
--[[
        tsserver = function()
            require('lspconfig').tsserver.setup({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })
        end,
        --- replace `example_server` with the name of a language server
        csharp_ls = function()
            require('lspconfig').csharp_ls.setup({
                ---
                -- in here you can add your own
                -- custom configuration
                ---
            })
        end,
        --]]