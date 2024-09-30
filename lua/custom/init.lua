vim.g["loaded_node_provider"] = nil
vim.g["loaded_python3_provider"] = nil
vim.opt.shell = "/usr/bin/zsh"
-- vim.cmd("source ./jupytext.vim")

package.path = package.path .. ";" .. "/home/max/.luarocks/share/lua/5.1/?/init.lua"
package.path = package.path .. ";" .. "/home/max/.luarocks/share/lua/5.1/?.lua"

vim.cmd("source " .. vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h") .. "/jupytext.vim")

vim.g.typst_pdf_viewer = "zathura"
vim.g.typst_conceal = 1
vim.g.typst_conceal_math = 1
vim.g.typst_conceal_emoji = 1
