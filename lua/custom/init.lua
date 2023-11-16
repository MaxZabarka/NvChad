vim.g["loaded_node_provider"] = nil
vim.g["loaded_python3_provider"] = nil
vim.opt.shell = "/usr/bin/zsh"
-- vim.cmd("source ./jupytext.vim")

vim.cmd("source " .. vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h") .. "/jupytext.vim")
