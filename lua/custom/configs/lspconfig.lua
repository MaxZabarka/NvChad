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
  "tailwindcss",
  "sqlls",
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
    root_dir = lspconfig.util.root_pattern("Cargo.toml", "package.json", "pyproject.toml", ".git"),
  }
end

require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onType" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	}
}

require("lspconfig").yamlls.setup {
  on_attach = on_attach,
  filetypes = { "yaml", "yml" },
  flags = { debounce_test_changes = 150 },
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        kubernetes = "*.yaml",
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
        ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
        ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
        ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
        ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
      },
    },
  },
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
