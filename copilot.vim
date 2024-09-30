let g:copilot_no_tab_map = v:true

imap <silent><script><expr> <C-Y> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-N> copilot#Next()
imap <silent><script><expr> <C-P> copilot#Previous()

