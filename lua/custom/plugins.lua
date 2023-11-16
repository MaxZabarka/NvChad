local plugins = {
  {
    "dccsillag/magma-nvim",
    lazy = false,
    init = function()
      print("fuck you")
      vim.cmd("source " .. vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h") .. "/magma.vim")
    end,
  },
  {
    "untitled-ai/jupyter_ascending.vim",
    lazy = false,
  },
  {
    "mattn/emmet-vim",
    lazy = false,
  },
  {
    "lepture/vim-jinja",
    lazy = false,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    commit = "e4d0721",
    lazy = false,
  },
  {
    "goerz/jupytext.vim",
    lazy = false,
  },
  {
    lazy = false,
    "SirVer/ultisnips",
  },
  {
    lazy = false,
    "MisanthropicBit/vim-numbers",
  },
  {
    lazy = false,
    "lervag/vimtex",
  },
  {
    lazy = false,
    "luochen1990/rainbow",
  },
  {
    lazy = false,
    "machakann/vim-highlightedyank",
  },
  {
    lazy = false,
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
      require("refactoring").setup()
    end,
  },

  {
    "LinArcX/telescope-ports.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "rcarriga/nvim-notify" },
    lazy = false,
    config = function()
      require("telescope").load_extension "ports"
    end,
  },
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = "kevinhwang91/promise-async",
  --   init = function()
  --     vim.o.foldcolumn = "1" -- '0' is not bad
  --     vim.o.foldlevel = 0    -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 0
  --     vim.o.foldenable = false
  --     --
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities.textDocument.foldingRange = {
  --       dynamicRegistration = false,
  --       lineFoldingOnly = true,
  --     }
  --     local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
  --     for _, ls in ipairs(language_servers) do
  --       require("lspconfig")[ls].setup {
  --         capabilities = capabilities,
  --         -- you can add other fields for setting up lsp server in this table
  --       }
  --     end
  --     require("ufo").setup()
  --   end,
  -- },
  {
    "caenrique/nvim-maximize-window-toggle",
    lazy = false,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    -- config = {
    --   highlight = {
    --     fg = "red",
    --     bg = "blue"
    --   }
    -- },
    config = true,
    event = { "WinNew" },
  },
  {
    -- "/home/max/Documents/test-nvim-plugin",
    dir = "/home/max/Documents/test-nvim-plugin",
    lazy = false,
    dev = true,
  },
  {
    "folke/neodev.nvim",
    opts = {},
    lazy = false,
    -- init = function()
    --   require("neodev").setup {}
    -- end,
  },
  {
    dependencies = { "nvim-lua/plenary.nvim" },
    "rest-nvim/rest.nvim",
    lazy = false,
    init = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = true,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      }
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    lazy = false,
    -- init = function()
    --   require("rust-tools").setup({
    --     server = {
    --     --   on_attach = function(_, bufnr)
    --     --       vim.keymap.set("n", "<leader>K", require("rust-tools.hover_actions").hover_actions, {buffer = bufnr})
    --     --       vim.keymap.set("n", "<leader>a", require("rust-tools.code_action_group").code_action_group, {buffer = bufnr})
    --     --   end
    --     }
    --   })
    -- end
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
        adapters = {
          "node",
          "chrome",
          "pwa-node",
          "pwa-chrome",
          "pwa-msedge",
          "node-terminal",
          "pwa-extensionHost",
          "lldb",
        }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      }
      require("dap").adapters.executable = {
        type = "executable",
        command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
        name = "lldb1",
        host = "127.0.0.1",
        port = 13000,
      }
      require("dap").configurations.rust = {
        {
          name = "Rust debug",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
        },
      }
      require("dap").adapters.codelldb = {
        name = "codelldb server",
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath "data" .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
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
              "dev",
            },
            cwd = "${workspaceFolder}",
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
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    init = function()
      require("dapui").setup()
      require("dap.ext.vscode").load_launchjs(nil, {})
    end,
  },
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
      vim.g.copilot_filetypes = { dapui_watches = false }
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
    config = function()
      vim.cmd "source  ~/.config/nvim/sandwich.vim"
    end,
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
  -- {
  --   "Matt-A-Bennett/vim-surround-funk",
  --   lazy = false,
  -- },
  {
    "williamboman/mason.nvim",
    opt = {
      ensure_installed = {
        "rust-analyzer",
      },
    },
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = false,
    init = function()
      local null_ls = require "null-ls"

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.rustfmt.with {
            extra_args = { "--edition=2018" },
          },
          -- null_ls.builtins.diagnostics.mypy,
          -- null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.black,
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
