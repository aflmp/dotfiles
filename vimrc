set nocompatible
set ttyfast
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set noswapfile
"set laststatus=2
set ruler
set wildmenu
set number
set relativenumber

set noerrorbells
set splitright
set splitbelow
set nocursorcolumn
set nocursorline
set noshowmode
set noshowmatch
set lazyredraw
set ignorecase

set incsearch
set hlsearch
nnoremap <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
set history=1000
set title
set updatetime=300
set maxmempattern=20000

set ttimeoutlen=0

"set mouse=a
let mapleader = ","
nmap <leader>ev :vs $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap Q <Nop>

"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"au filetype go inoremap <buffer> . .<C-x><C-o>
"set termguicolors
syntax enable

filetype plugin indent on

set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

let $GOPATH = "/Users/afaaq/go"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_auto_sameids = 1


"=====nerdcommenter=====
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle

" ==================== NerdTree ====================
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeShowHidden=1

"=====smartclose=====
let g:smartclose_default_mapping_key = '<F10>'

"=====supertab + utilsnip=====
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"  
let g:UltiSnipsJumpBackwardTrigger="<s-tab>" 

"=====delimitMate=====
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)' 

" ==================== FZF ====================
set rtp+=/usr/local/opt/fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'down': '~20%' }

" search 
nmap <C-p> :History<cr>
imap <C-p> <esc>:<C-u>History<cr>

" search across files in the current directory
nmap <C-f> :FzfFiles<cr>
imap <C-f> <esc>:<C-u>FzfFiles<cr>

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

