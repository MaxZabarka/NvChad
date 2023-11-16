let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
 let g:sandwich#recipes += [
       \   {
       \     'buns'    : ['<div>', '</div>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['d'],
       \   },
       \   {
       \     'buns'    : ['<a href="">', '</a>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['a'],
       \   },
       \   {
       \     'buns'    : ['<ul>', '</ul>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['u'],
       \   },
       \   {
       \     'buns'    : ['<li>', '</li>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['l'],
       \   },
       \   {
       \     'buns'    : ['<span>', '</span>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['s'],
       \   },
       \   {
       \     'buns'    : ['<p>', '</p>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['p'],
       \   },
       \   {
       \     'buns'    : ['<>', '</>'],
       \     'kind'    : ['add', 'replace'],
       \     'action'  : ['add'],
       \     'input'   : ['f'],
       \   },
       \ ]

nnoremap sad a<div></div><esc>T>i<esc>
nnoremap saa a<a href=""></a><esc>T>i<esc>
nnoremap sau a<ul></ul><esc>T>i<esc>
nnoremap sal a<li></li><esc>T>i<esc>
nnoremap sas a<span></span><esc>T>i<esc>
nnoremap sap a<p></p><esc>T>i<esc>
nnoremap saf a<></><esc>T>i<esc>
