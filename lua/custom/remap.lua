vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>")

vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').stop()<CR>")
vim.keymap.set("n", "<leader>dt", '<cmd>lua require("dapui").toggle()<CR>')

vim.keymap.set("n", "<leader>u", "<Plug>RestNvim")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
-- vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- quit
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>")

-- Run prev commands
vim.api.nvim_set_keymap("n", "<leader>;", "@:", { noremap = true })

-- vim.api.nvim_create_augroup()
-- Toggle maximize
vim.keymap.set("n", "<leader>m", ":ToggleOnly<CR>", { silent = true, noremap = true })

-- Run current file
vim.keymap.set("n", "<leader>ru", ":source %<CR>", { silent = true, noremap = true })



-- vim.api.nvim_exec(
--   [[
--   augroup filetype_lua
--     autocmd!
--     autocmd FileType typescript,typescriptreact,javascript,javascriptreact nnoremap <leader>cl oconsole.log("<Esc>pA >> ", <Esc>pA);<Esc>
--     autocmd FileType rust nnoremap <leader>cl oprintln!("<Esc>pA >> {:#?}", <Esc>pA);<Esc>
--   augroup END
-- ]],
--   false
-- )
vim.api.nvim_exec(
  [[
  augroup filetype_lua
    autocmd!
      autocmd FileType typescript,typescriptreact,javascript,javascriptreact nnoremap <leader>ln ^vg_dIconsole.log('<Esc>pA >> ', <Esc>pA);<Esc>
    autocmd FileType rust nnoremap <leader>ln ^vg_dIprintln!("<Esc>pA >> {:#?}", <Esc>pA);<Esc>
  augroup END
]],
  false
)
-- vim.keymap.set("n", "<leader>ln", "0vg_dIconsole.log('<Esc>pA >> ', <Esc>pA);<Esc>")

-- vim.keymap.set("v", "<leader>l", '"ly<Esc>oconsole.log("<Esc>"lpA >> ", <Esc>"lpA);<Esc>', { silent = true, noremap = true });
-- vim.keymap.set("v", "<leader>l", '"ly<Esc>oprintln!("<Esc>"lpA >> {:#?}", <Esc>"lpA);<Esc>', { silent = true, noremap = true });

-- vim.keymap.set("v", "<leader>l", '"ly<Esc>oprint!("<Esc>"lpA >> ", <Esc>"lpA);<Esc>', { silent = true, noremap = true });
-- print!("leader", leader);
-- local function lines_from(file)
-- console.log("local", local);
-- console.log("function", function);
--   local lines = {}
--   for line in io.lines(file) do
--     lines[#lines + 1] = line
--   end
--   return lines
-- end
-- local testtable = (lines_from "/home/max/.config/nvim/lua/custom/test")
-- P(testtable)

-- result = vim.lsp.util.open_floating_preview({"# test, **sdf**, *sdfdf*, # sdfd"}, "markdown", { border = "rounded" })

-- local bufnr = vim.api.nvim_get_current_buf() -- get buffer number
-- vim.api.nvim_win_set_option(0, "foldmethod", "indent") -- set buffer-local option
--
-- local popup = require "plenary.popup"
-- local function create_default_popup()
--   local win_id = popup.create({ "menu item 1", "menu item 2", "menu item 3" }, {})
--   print(win_id)
-- end
-- create_default_popup()

-- vim.keymap.set("n", "<F4>", "<cmd>lua require('dapui').toggle()<CR>")
-- vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
-- vim.keymap.set("n", "<F9>", "<cmd>lua require('dap').continue()<CR>")
--
-- vim.keymap.set("n", "<F1>", "<cmd>lua require('dap').step_over()<CR>")
-- vim.keymap.set("n", "<F2>", "<cmd>lua require('dap').step_into()<CR>")
-- vim.keymap.set("n", "<F3>", "<cmd>lua require('dap').step_out()<CR>")
--
-- vim.keymap.set("n", "<Leader>dsc", "<cmd>lua require('dap').continue()<CR>")
-- vim.keymap.set("n", "<Leader>dsv", "<cmd>lua require('dap').step_over()<CR>")
-- vim.keymap.set("n", "<Leader>dsi", "<cmd>lua require('dap').step_into()<CR>")
-- vim.keymap.set("n", "<Leader>dso", "<cmd>lua require('dap').step_out()<CR>")
--
-- vim.keymap.set("n", "<Leader>dhh", "<cmd>lua require('dap.ui.variables').hover()<CR>")
-- vim.keymap.set("v", "<Leader>dhv", "<cmd>lua require('dap.ui.variables').visual_hover()<CR>")
--
-- vim.keymap.set("n", "<Leader>duh", "<cmd>lua require('dap.ui.widgets').hover()<CR>")
-- vim.keymap.set("n", "<Leader>duf", "<cmd>lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>")
--
-- vim.keymap.set("n", "<Leader>dro", "<cmd>lua require('dap').repl.open()<CR>")
-- vim.keymap.set("n", "<Leader>drl", "<cmd>lua require('dap').repl.run_last()<CR>")
--
-- vim.keymap.set("n", "<Leader>dbc", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
-- vim.keymap.set("n", "<Leader>dbm", "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>")
-- vim.keymap.set("n", "<Leader>dbt", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
--
-- vim.keymap.set("n", "<Leader>dc", "<cmd>lua require('dap.ui.variables').scopes()<CR>")
-- vim.keymap.set("n", "<Leader>di", "<cmd>lua require('dapui').toggle()<CR>")
