local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = { "rust_analyzer", "lua_ls", "tsserver", "eslint" }

local new_on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  on_attach(client, bufnr)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = new_on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.on_attach(function(client, bufnr)
--   print "attach"
-- end)

-- require("lsp").on_attach(function()
--   print "attached"
-- end)

-- on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--   vim.keymap.set("n", function()
--     vim.lsp.buf.definition()
--   end, opts)
-- end)

-- require("mason").setup()
-- local mason_lspconfig = require("mason-lspconfig")
--
-- mason_lspconfig.setup({
--   ensure_installed = {"rust_analyzer", "lua_ls"},
--   automatic_installation = true
-- })

-- lspconfig.rust_analyzer.setup({
--    on_attach = on_attach,
--    capabilities =capabilities,
--    filetypes = {"rust"},
--    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
--    settings = {
--      ['rust_analyzer'] = {
--        cargo = {
--          allFeatures = true
--        }
--      }
--    }
--  })
--
--  lspconfig.lua_ls.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
-- lspconfig.tsserver.setup{}
-- lspconfig.eslint.setup{}
