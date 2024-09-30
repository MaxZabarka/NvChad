local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- rust-tools will set up rust,no need to put it here
local servers = {
  "tsserver",
  "eslint",
  "texlab",
  -- "jedi_language_server"
  "pyright",
  "gleam",
  "typst_lsp",
  "svelte",
  "tailwindcss"
  -- "ltex-ls"
}

-- local new_on_attach = function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   on_attach(client, bufnr)
-- end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onType" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	}
}

require("rust-tools").setup { server = { on_attach = on_attach } }
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
