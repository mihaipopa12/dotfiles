" Copy indent from current line when starting a new line.
set autoindent

" Show the line and column number of the cursor position.
set ruler

" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" Print the line number in front of each line.
set number

" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Expand tabs to spaces.
:set expandtab

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=2

" Do smart autoindenting when starting a new line.
set smartindent

" Turn on syntax.
syntax on

" Enable highlight for current search word.
:set hlsearch

" Wrap long lines.
:set wrap
:set linebreak
:set nolist  " list disables linebreak

" Shortcut for non-autoformatted paste.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Highlight current line.
" set cursorline
" hi CursorLine term=bold cterm=bold ctermbg=234

noremap <C-k> 3k
noremap <C-j> 3j

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Ctrl P plugin.
" set runtimepath^=~/.vim/bundle/ctrlp.vim

" Fuzzy file finder.
set rtp+=~/.fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Search entire project directory, not only cwd.
function! s:find_root()
  for vcs in ['.git', '.svn', '.hg']
    let dir = finddir(vcs.'/..', ';')
    if !empty(dir)
      execute 'FZF' dir
      return
    endif
  endfor
  FZF
endfunction

command! FZFR call s:find_root()

" Map fzf to (recursive) ctrlp.
noremap <C-p> :FZFR<CR>

" VUNDLE configuration.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here.
Bundle 'dyng/ctrlsf.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" CtrlSF configuration.
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '50%'
" Old key bindings.
" nmap     <C-f> <Plug>CtrlSFPrompt
" vmap     <C-f> <Plug>CtrlSFVwordPath
" nnoremap <C-f>o :CtrlSFOpen<CR>
" Toggle needed?
" nnoremap <C-F>t :CtrlSFToggle<CR>
" noremap <C-F>t <Esc>:CtrlSFToggle<CR>

" New key bindings.
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Multiple cursors configuration.
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Nerd tree mappings.
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeMapOpenSplit='x'

