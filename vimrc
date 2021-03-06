" We need to use python 3 for our stuff
"let $PYTHONPATH="/usr/lib/python3.4/site-packages"
" Basic configurations
set nocompatible
set encoding=utf-8

" Settings {{{
"-------------------------------------------------
" File Detection
syntax on

" Use these directories for runtime stuff (plugins, etc.)
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,~/.vim/bundle/vundle

" Vundle {{{
filetype off

call vundle#begin()
" let Vundle manage Vundle
" " " required!
"
if has('python') == 1 || has('python3') == 1
  Plugin 'klen/python-mode'
endif

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'raichoo/haskell-vim'

if version >= 703 && has('lua') == 1
  Plugin 'Shougo/neocomplete.vim'
endif

call vundle#end()

filetype plugin indent on
" }}}

" Local vimrc files
set exrc
set secure

set undodir=~/.vim/swap//,.,~/tmp,/var/tmp,/tmp,$TEMP
set undofile

" Input
set backspace=2         "backspace over everything

" Visual
set fcs=vert:│,fold:-   " solid instead of broken line for vert splits
set nowrap
set hidden              " hide when switching buffers, don't unload
set laststatus=2
set mouse=a             " enable mouse in all modes
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set spelllang=en_us
set title
set linebreak           " break lines on word-boundaries
set shortmess=filnxtToOI

" Menu
set wildmenu
set wildmode=full
set completeopt=menuone
set history=50          " keep 50 lines of command line history

" folding
set foldignore=
set foldlevelstart=99
set foldmethod=syntax
set fdc=2

" Tabs
set autoindent
set expandtab
set shiftwidth=4        " Num of spaces to use for each (auto)indent.
set smarttab
set softtabstop=4
set tabstop=4

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Files
set nobackup            " don't keep a backup file during editing
set nowritebackup       " don't save the backup file
set number              " display line numbers
"set directory=".,~/tmp,/var/tmp,/tmp"
set directory=~/.vim/swap//,.,~/tmp,/var/tmp,/tmp,$TEMP

" GUI stuff
set guioptions=


" LaTeX Suite {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
let g:Tex_ViewRule_dvi = 'xdvi'
" }}}

" From gtmanfred {{{
" " Netrw {{{
let g:netrw_http_cmd='curl -sL'
let g:netrw_http_xcmd='-o'
let g:netrw_silent=1
" " }}}
" " Clang {{{
let g:clang_library_path = "/usr/lib"
let g:clang_auto_select = 1
" " }}}
" " Compression {{{
let g:tar_cmd = 'bsdtar'
let g:zip_unzipcmd = 'bsdtar'
let g:zip_unzipflag = 'Ptf'
let g:zip_readflags = 'OPxf'
" " }}}
" }}}

"pymode {{{
if has('python3') == 1
  let g:pymode_python = 'python3'
else
  let g:pymode_python = 'python'
endif
let g:pymode_folding = 1
let g:pymode_doc = 1
let g:pymode_rope_show_doc_bind = 'K'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_trim_whitespaces = 0
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8']
let g:pymode_lint_cwindow = 0
"}}}

" airline settings {{{
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = 'µ'
" }}}

" YCM {{{
let g:ycm_extra_conf_globlist = [ '~/git/KaiSforza/*', '*' ]
let g:ycm_filetype_blacklist = { 'python' : 1 }
" }}}

" neocomplete.vim {{{
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" }}}

" Tagbar {{{
let g:tagbar_autofocus = 0
let g:tagbar_left = 0
let g:tagbar_ctags_bin= "~/.nix-profile/bin/ctags"
" }}}

"Color scheme
set background=dark
colo darkZ2

" Tlist Commands and variables
nnoremap <silent> <F9> :TlistUpdate<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Max_Submenu_Items = 20
let Tlist_Display_Prototype = 0
let Tlist_Enable_Fold_Column = 0
"let Tlist_Display_Prototype = 1
let tlist_PKGBUILD_settings='sh;f:function'
" Simple patch to tlist to allow using it as a split window
let Tlist_Use_Split_Window = 1
let Tlist_Ctags_Cmd = "~/.nix-profile/bin/ctags"

" Nerdtree mappings
let NERDTreeMinimaLUI = 0

" Open nerdtree and tlist at the same time on the left
com TT NERDTreeToggle | TlistToggle
nnoremap <silent> <F8> :TT<CR>

" Buffer navigtion like tab navigation
nnoremap <silent> bt :bnext<CR>
nnoremap <silent> bT :bprevious<CR>

" PDF Stuff
"command Rpdf :r !pdftotext -nopgbrk <q-args> -
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Paste remaps
nnoremap <silent> <Leader>pp "+p
nnoremap <silent> <Leader>Pp "+P
nnoremap <silent> <Leader>pP "*p
nnoremap <silent> <Leader>PP "*P

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
augroup END

" Convenient command to see the difference between the current buffer and
" the file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

" Version specific stuffs{{{
if version >= 703
  "This stuff doesn't like working with old versions, I think 7.3 was when
  "this was included.
  autocmd FileType text setlocal textwidth=78 colorcolumn=78
  au FileType python setlocal tabstop=4 expandtab shiftwidth=4
        \ softtabstop=4 textwidth=79  colorcolumn=79
        \ omnifunc=pythoncomplete#Complete
  set colorcolumn=76
  hi ColorColumn ctermbg=1 guibg=red
  au BufNewFile,BufRead *vimperator-* set tw=0 wrap colorcolumn=0
else
  autocmd FileType text setlocal textwidth=78
  au FileType python setlocal tabstop=4 expandtab shiftwidth=4
        \ softtabstop=4 textwidth=79 sh=ipython3
        \ omnifunc=pythoncomplete#Complete
  au BufNewFile,BufRead *vimperator-* set tw=0 wrap
endif "}}}

au FileType java set tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
au FileType java set makeprg=/usr/bin/javac\ %
au FileType PKGBUILD set makeprg=/usr/bin/makepkg

au BufNewFile,BufRead *.t2t set ft=txt2tags
au BufNewFile,BufRead *.md  set ft=markdown tw=76
au BufNewFile,BufRead *.rst set tw=76
au BufNewFile,BufRead *.asm set tabstop=4 expandtab shiftwidth=4
      \ softtabstop=4
au FileType haskell setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" vim: foldmethod=marker :
