let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +313 ~/.config/nvim/lua/custom/plugins.lua
badd +22 ~/.config/nvim/lua/custom/remap.lua
badd +1 health://
badd +5 ~/.config/nvim/rplugin/python3/main.py
badd +9 ~/.local/share/nvim/rplugin.vim
badd +5 ~/Documents/portfolio/src/main.ts
badd +1 ~/Documents/aoc/d_24/src/main
badd +13 ~/Documents/aoc/d_24/src/main.rs
badd +5 ~/.config/nvim/lua/custom/configs/lspconfig.lua
badd +143 ~/.config/nvim/lua/plugins/init.lua
badd +2 ~/.config/nvim/lua/plugins/configs/telescope.lua
badd +1 ~/.config/nvim/lua/custom/configs/telescope.lua
badd +1 ~/.config/nvim/lua/custom/init.lua
badd +1 ~/.config/nvim/lua/custom/chadrc.lua
badd +1 ~/.config/nvim/lua/custom/globals.lua
badd +1 ~/.config/nvim/lua/custom/test
argglobal
%argdel
$argadd ~/.zshrc
edit ~/.config/nvim/lua/custom/plugins.lua
argglobal
balt ~/.config/nvim/lua/plugins/init.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 2 - ((1 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 03|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
