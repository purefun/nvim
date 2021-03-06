local opts = { noremap=true, silent=true }

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)

  -- require "lsp_signature".on_attach({
  --   bind = true, -- This is mandatory, otherwise border config won't get registered.
  --   hint_enable = false,
  --   floating_window_above_cur_line = false,
  --   handler_opts = {
  --     border = "none"
  --   }
  -- }, bufnr)

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end


-- repo: https://github.com/typescript-language-server/typescript-language-server
-- install: yarn global add typescript typescript-language-server
require('lspconfig').tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- repo: https://github.com/sumneko/lua-language-server
-- install: brew install lua-language-server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- repo: https://github.com/hrsh7th/vscode-langservers-extracted
-- install: yarn global add vscode-langservers-extracted
require'lspconfig'.eslint.setup {}

-- repo: https://github.com/hrsh7th/vscode-langservers-extracted
-- install: yarn global add vscode-langservers-extracted

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
}

-- repo: https://github.com/prisma/language-tools/tree/main/packages/language-server
-- install: yarn global add @prisma/language-server
require'lspconfig'.prismals.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- repo: https://github.com/golang/tools/tree/master/gopls
-- install: go install golang.org/x/tools/gopls@latest
require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

require'lspconfig'.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- settings = {
    -- yaml = {

    -- }
  -- }
}


  -- autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js lua vim.lsp.buf.formatting_sync()

vim.cmd [[
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
  autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js Prettier
]]


vim.cmd [[
  autocmd BufWritePre *.json,*.jsonc lua vim.lsp.buf.formatting_sync()
]]


vim.cmd [[
  autocmd BufWritePre *.prisma lua vim.lsp.buf.formatting_sync()
]]
