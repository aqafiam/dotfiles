" ---
" vista
" ---
nmap <silent> <C-q> :Vista!!<CR>
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'python': 'vim_lsp',
  \ 'go': 'vim_lsp',
  \ 'typescript': 'vim_lsp',
  \ 'typescriptreact': 'vim_lsp',
  \ 'rust': 'vim_lsp',
  \ }
let g:vista_sidebar_width = 48
let g:vista#renderer#enable_icon = 0
let g:vista_fzf_preview = ['right:50%']


" ---
" gitgutter
" ---
highlight GitGutterAdd    guifg=#5bb15b guibg=#1d2021
highlight GitGutterChange guifg=#c0c036 guibg=#1d2021
highlight GitGutterDelete guifg=#e04a4a guibg=#1d2021

set signcolumn=yes:1


" ---
" undotree
" ---
set undofile
set undodir=~/.cache/nvim/undofile
let g:undotree_WindowLayout = 3
let g:undotree_DiffpanelHeight = 30
let g:undotree_SplitWidth = 50
nnoremap <silent> <Leader>un :UndotreeToggle<CR>:UndotreeFocus<CR>

