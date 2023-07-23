vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>" )

vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').stop()<CR>")
vim.keymap.set("n", "<leader>dt", "<cmd>lua require(\"dapui\").toggle()<CR>")

vim.keymap.set("n", "<leader>u", "<Plug>RestNvim");


-- Run prev commands
vim.api.nvim_set_keymap("n", "<leader>;", "@:", { noremap = true });

-- Toggle maximize
vim.keymap.set("n", "<leader>m", ":ToggleOnly<CR>", { silent = true, noremap = true })

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
