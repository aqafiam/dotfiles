" -----
" set
" -----
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp,
set fileformats=unix,dos,mac
scriptencoding utf-8

set sh=zsh

set ambiwidth=double
set backspace=start,eol,indent
set bs=2
set cindent
set completeopt=menuone,noinsert
set cursorline
set diffopt=internal,filler,algorithm:histogram,indent-heuristic
set display=lastline
set expandtab
set guifont=Cica:h15
set guioptions-=T
set hidden
set history=4096
set hlsearch
set ignorecase
set inccommand=split
set incsearch
set laststatus=2
set lazyredraw
set list
set matchtime=1
set noswapfile
set nrformats=
set number
set ruler
set secure
set shiftwidth=2
set shortmess+=I
set showcmd
set showmatch
set showtabline=2
set smartcase
set softtabstop=2
set tabstop=2
set ttyfast
set vb t_vb=
set virtualedit=all
set whichwrap=b,s,[,],<,>,~
set wildmenu
set wildmode=longest:full,full
set wrap

filetype plugin indent on

if has('win32') || has('win64') || has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif


" -----
" vimgrep
" -----
if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading\ --sort-files
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif


" -----
" commands
" -----
command! -nargs=* -complete=file Rg :silent grep <args>
command! Rv source $MYVIMRC
command! Ev edit $HOME/dotfiles/.vimrc
cabbr w!! w !sudo tee > /dev/null %


" -----
" autocmd
" -----
augroup GeneralAutocmdSetting
  " common
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
  autocmd InsertLeave * set nopaste
  autocmd QuickFixCmdPost *grep* cwindow
  autocmd Filetype json setl conceallevel=0
  " highlight
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd WinEnter * match IdeographicSpace /　/
  " colorscheme
  autocmd ColorScheme * hi LineNr ctermfg=239
  autocmd ColorScheme * hi Normal ctermbg=none
  autocmd ColorScheme * hi Todo ctermfg=230 ctermbg=none guifg=Yellow guibg=none
  " jinja
  au BufNewFile,BufRead *.yml.j2,*.yaml.j2 set ft=yaml
  au BufNewFile,BufRead *.conf,*.conf.j2 set ft=conf
augroup END


" -----
" mappings
" -----
let mapleader = "\<Space>"

tnoremap <ESC> <C-\><C-n>

nnoremap / /\v
nnoremap j gj
nnoremap k gk
nnoremap cn *Ncgn
nnoremap cN *NcgN

nnoremap <C-g> :echo expand('%:p')<Return>

nnoremap <silent> <Leader>p "0p
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <silent> <Leader>t :new \| :terminal<CR><insert>
nnoremap <silent> <Leader>T :tabnew \| :terminal<CR><insert>
nnoremap <silent> <Leader>vt :vne \| :terminal<CR><insert>

" move by byte unit on insert mode
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-c> <ESC>

" use it later...
nnoremap <c-j> <Nop>
inoremap <c-j> <Nop>
vnoremap <c-j> <Nop>
nnoremap <c-k> <Nop>
inoremap <c-k> <Nop>
vnoremap <c-k> <Nop>

nnoremap <silent> <Leader>co :copen<cr>
nnoremap <silent> <Leader>cl :cclose<cr>
nnoremap <silent> <Leader>cc :call ToggleQuickFix()<cr>
function! ToggleQuickFix()
  if getqflist({'winid' : 0}).winid
    cclose
  else
    copen
  endif
endfunction

