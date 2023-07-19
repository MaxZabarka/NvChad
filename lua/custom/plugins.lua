local plugins = {
  {
    "puremourning/vimspector",
    lazy = false
  },
  {
    "microsoft/vscode-js-debug",
    lazy = false,
    build = "!npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    init = function()
      require("dap-vscode-js").setup {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
        -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = { "node", "chrome", "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      }
      for _, language in ipairs { "typescript", "javascript", "typescriptreact" } do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "node-terminal",
            name = "Run Script: start:debug",
            request = "launch",
            command = "npm run dev",
            cwd = "${workspaceFolder}",
          },
          {
            type = "node-terminal",
            name = "Run Script: dev",
            request = "launch",
            command = "npm run dev",
            cwd = "${workspaceFolder}",
          },
           {
            type = "pwa-node",
            request = "launch",
            name = "Launch via NPM",
            runtimeExecutable = "npm",
            runtimeArgs = {
                "run-script",
                "dev"
            },
            cwd= "${workspaceFolder}"
        },
        }
      end
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
  },
  {
    "Pocco81/dap-buddy.nvim",
    lazy = false,
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   lazy = false,
  --   init = function()
  --     require("dapui").setup()
  --   end,
  -- },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
  },
  {
    "glacambre/firenvim",

    -- Lazy load firenvim
    -- cond = not not vim.g.started_by_firenvim,
    build = function()
      require("lazy").load { plugins = "firenvim", wait = true }
      vim.fn["firenvim#install"](0)
    end,
    lazy = false,
  },
  {
    "metakirby5/codi.vim",
    lazy = false,
  },
  {
    "github/copilot.vim",
    init = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_filetypes = { dapui_watches = false}
    end,
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function() end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    lazy = false,
  },
  -- {
  --   "glepnir/dashboard-nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("dashboard").setup {
  --       config = {
  --         header = false,
  --       },
  --     }
  --   end,
  --   dependencies = { { "nvim-tree/nvim-web-devicons" } },
  -- },
  {
    "mhinz/vim-startify",
    lazy = false,
  },
  {
    "pocco81/AutoSave.nvim",
    lazy = false,
  },
  {
    "chomosuke/term-edit.nvim",
    lazy = false, -- or ft = 'toggleterm' if you use toggleterm.nvim
    version = "1.*",
  },

  {
    "machakann/vim-sandwich",
    lazy = false,
  },
  {
    "michaeljsmith/vim-indent-object",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "Matt-A-Bennett/vim-surround-funk",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    opt = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    init = function()
      local null_ls = require "null-ls"

      null_ls.setup {

        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.eslint,
        },
        -- on_attach = function(client, bufnr)
        --   vim [[autocmd BufWritePost * lua print("hello!")]]
        --   -- print "HERERERER"
        --   -- if client.supports_method "textDocument/formatting" then
        --   --   vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
        --   --   vim.api.nvim_create_autocmd("BufWritePre", {
        --   --     group = augroup,
        --   --     buffer = bufnr,
        --   --     callback = function()
        --   --       print "SAVED"
        --   --       vim.lsp.buf.format { async = false }
        --   --     end,
        --   --   })
        --   -- end
        -- end,
      }
    end,
  },
}

return plugins
