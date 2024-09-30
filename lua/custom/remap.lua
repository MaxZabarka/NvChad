
-- Obsidian
vim.keymap.set("n", "<leader>fo", "<cmd>ObsidianQuickSwitch<CR>", { silent = true, noremap = true })

vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>")

vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').stop()<CR>")
vim.keymap.set("n", "<leader>dt", '<cmd>lua require("dapui").toggle()<CR>')

vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

vim.keymap.set("n", "<leader>u", "<Plug>JupyterExecute")

-- unmap tab
-- vim.cmd("unmap tab")
vim.g.UltiSnipsExpandTrigger = "<C-r>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-r>"

-- Magma
-- vim.api.nvim_set_keymap('n', '<Leader>r', ':MagmaEvaluateOperator<CR>', { noremap = true, silent = true, expr = true })
-- vim.api.nvim_set_keymap('n', '<Leader>r', ':MoltenEvaluateLine<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<Leader>r', ':<C-u>MoltenEvaluateVisual<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':MoltenReevaluateCell<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>rd', ':MoltenDelete<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>ro', ':MoltenShowOutput<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>rs', ':MoltenInit python3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rj", ":MoltenNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rk", ":MoltenPrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>rd", ":MoltenInterrupt<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ro", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, noremap = true, desc = "show/enter output" })
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.diagnostic.open_float(nil, { border="single"})<CR>', { noremap = true, silent = true })


local group = vim.api.nvim_create_augroup('PythonMolten', { clear = true })

-- Autocmd for saving Python files
vim.api.nvim_create_autocmd('BufWritePost', {
    group = group,
    pattern = '*.py',
    command = 'silent! MoltenSave'
})

-- Autocmd for loading Python files
vim.api.nvim_create_autocmd('BufReadPost', {
    group = group,
    pattern = '*.py',
    command = 'silent! MoltenLoad'
})

-- vim.g.UltiSnipsExpandTrigger = "<C-j>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<C-j>"
-- vim.g.UltiSnipsJumpBackwardTrigger = ':'

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

vim.keymap.set("n", "<leader>i", function()
  require("nvterm.terminal").toggle "float"
end)

-- Tabs
vim.keymap.set("n", "<leader>tn", "<C-\\><C-n>:tabnew<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tx", "<C-\\><C-n>:tabclose<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tj", "<C-\\><C-n>:tabnext<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tk", "<C-\\><C-n>:tabprev<CR>", { silent = true, noremap = true })

-- vim.api.nvim_create_user_command(
--   'TypstOpen',
--   function()
--     local filepath = vim.api.nvim_buf_get_name(0)  -- Get the current buffer's file path
--     if filepath:match('%.typ$') then                -- Check if the file has a .typ extension
--       vim.cmd('!itypst ' .. filepath)               -- Run itypst with the file path
--     else
--       print('Not a .typ file')                      -- Print a message if the file is not a .typ
--     end
--   end,
--   {}
-- )
--
