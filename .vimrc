""""""""""""""""""""""""""""""""""""""
" The vimrc file of Dakota Nelson    "
" Adapted from that of Evan Morikawa "
""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
" Vundle Packages "
"""""""""""""""""""

" Simply type :BundleInstall to install everything.

set nocompatible " Does not use old vi quirks
filetype off     " Required temporarily for vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Helps me collaborate "
""""""""""""""""""""""""
" A Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Helps me see "
""""""""""""""""
" Colors CSS tags with the appropriate color.
Bundle 'skammer/vim-css-color'

" Add CSS3 syntax support to vim's built-in `syntax/css.vim`
Bundle 'hail2u/vim-css3-syntax'

" Less syntax support
Bundle 'groenewege/vim-less'

" CoffeeScript support for vim
Bundle 'kchmck/vim-coffee-script'

" Markdown syntax for vim
Bundle 'tpope/vim-markdown'

" Shows indent level
Bundle 'nathanaelkane/vim-indent-guides'

" Solarized color schemes. We use Dakota's color scheme for dark and
" Solarized for light bg.
Bundle 'altercation/vim-colors-solarized'

" Helps me search "
"""""""""""""""""""
Bundle 'grep.vim'

" Helps me move "
"""""""""""""""""
" A tree explorer plugin for vim
" <c-n>
Bundle 'scrooloose/nerdtree'

" Extends % operator to match html tags and others.
Bundle 'tsaleh/vim-matchit'

" Unload/delete/wipe a buffer, keep its window(s)
Bundle 'bufkill.vim'

" Helps me type "
"""""""""""""""""

" Quoting/parenthesizing made simple
" cs<match><replace>
" ds<match>
" v<selection>S<replacement>
Bundle 'tpope/vim-surround'

" Enable repeating supported plugin maps with '.'
Bundle 'tpope/vim-repeat'

" A parser for a condensed HTML format
" <c-e> after a block of sparkup-formatted pre-html
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" Easily comment in and out lines
" <leader>__
Bundle 'tomtom/tcomment_vim'

" Vim motions on speed. Replaces the <number> in <number><motion>
" <leader><leader><motion>
Bundle 'Lokaltog/vim-easymotion'

" Key remappings ordered by approximate frequency of use"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

"Quick escape and saving via button-mashing
inoremap jk <Esc>
inoremap kj <Esc>
cnoremap jk <Esc>
cnoremap kj <Esc>
inoremap df <Esc>:w<CR>
inoremap fd <Esc>:w<CR>
noremap df :w<CR>
noremap fd :w<CR>

"Easier movement around the page
noremap <C-j> 3<C-e>
noremap <C-k> 3<C-y>
noremap <S-j> 3j
noremap <S-k> 3k
noremap <S-l> 5l
noremap <S-h> 5h
noremap <PageUp> <c-u>
noremap <PageDown> <c-d>
noremap <Home> 0
noremap <End> $
noremap j gj
noremap k gk
noremap 0 ^

"Move between buffers
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

"Change to light bg
noremap <leader>l :set background=light<cr>:colorscheme solarized<cr>

"Change to dark bg
noremap <leader>d :set background=dark<cr>:colorscheme dakota<cr>

" Unhighlight
noremap <S-Space> :nohl<CR>
" Space bar searching
noremap <space> /

noremap <F1> <nop>


"Git commands
noremap gs :Gstatus<CR>
noremap ga :Gwrite<CR>
noremap gc :Gcommit -a<CR>
noremap gd :Gdiff<CR>
noremap gl :Gdiff HEAD~1<CR>
noremap gb :Gbrowse<CR>

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Edit Vimrc
" $MYVIMRC points to the ~/.vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
" Re-source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" noremap <C-Q> <esc>:bd<CR>:vsp<CR>:bn<CR>:buffers<CR>
noremap <C-Q> <esc>:bd<CR>

"Info about the character undernath cursor
nnoremap gi ga

" Toggles paste mode and shows value of the option
nnoremap <F2> :set invpaste paste?<CR>
noremap <C-S> :%s/

"Smart folding on shift-space
nnoremap <silent> zz @=(foldlevel('.')?'za':'l')<CR>
vnoremap zz zf

"shell shortcuts in command mode
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"Displays the tag type under the cursor. Really useful for generating colors
map <c-x> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans <'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Settings "
""""""""""""
filetype plugin indent on " Turn on filetype after Vundle is setup
colorscheme dakota
syntax enable

set nu "Turn on line numbers
set list "All characters print. Including meta characters
set ts=2
set sw=2
set ruler "Shows the ruler
set magic "set magic on, for regular expressions
set mat=2 "two-tenths of a second blink
set smarttab
set wildmenu "Enhanced tab completion
set autoread "Set to auto read when a file is changed from the outside
set vb t_vb= "disables visual bell
set hlsearch
set showmode " Says whether or not paste mode is turned on or off
set t_Co=256 "Enable colored terminal
let &t_Co=256
set incsearch "Incremental search
set smartcase "Will switch to case sensitive if a cap is used
set showmatch "Shows matches on search
set expandtab "Replaces tabs with spaces
set tabstop=2 "Num characters when tab is pushed
set ignorecase "case insensitive search but see next option
set autoindent "Enable automatic alignment during insertions
set noswapfile "Don't use swp files
set cindent "Tries to recognize code and indent
set textwidth=0 "Don't hard wrap lines
set cmdheight=2 "The commandbar height
set noerrorbells
set novisualbell
set history=1000
set laststatus=2 "Always show the status line
set restorescreen
set encoding=utf8
set shell=/bin/sh "Use bash shell
set guioptions-=T "Removes GUI bars
set guioptions-=l "Removes scrollbars
set guioptions-=r "Removes scrollbars
set guioptions-=b "Removes scrollbars
set pastetoggle=<F2> " Binds F2 to pastetoggling
set wildmode=list:longest,full " bash command line tab completion
set listchars=tab:\|\ ,trail:●,extends:>,precedes:<,nbsp:+ "Whitespace showing
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" Custom commands "
"""""""""""""""""""
" Removes all trailing whitespace
command! Whitespace %s/\s\+$//e

command! -nargs=1 Gr Grep -ErinI --exclude-dir=log --exclude-dir=tmp --exclude-dir=coverage <args> *

command! CopyTitle !echo "%\c" | pbcopy

" Autocommands "
"""""""""""""""
" Mixes in html filetype to web languages
augroup html_mixin
  autocmd!
  au BufRead,BufNewFile *.php set ft=php.html
  au BufRead,BufNewFile *.erb set ft=eruby.html
  au BufRead,BufNewFile *.coffee set ft=coffee
augroup END

" Utility Methods "
""""""""""""""""""
"match LineTooLong /\%>74v.\+/

function! CurDir()
  let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""
" Language Specific Settings "
""""""""""""""""""""""""""""""

" Python "
""""""""""
augroup python_helpers
  autocmd!
  au FileType python setl
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4

  au BufWrite *.py :call DeleteTrailingWS() "Deletes trailing whitepace
  let python_highlight_all = 1
  au FileType python syn keyword pythonDecorator True None False self

  au BufNewFile,BufRead *.jinja set syntax=htmljinja
  au BufNewFile,BufRead *.mako set ft=mako
  au BufNewFile,BufRead *.less set ft=less
augroup END

let &t_Sf="\<Esc>[3%dm"
let &t_Sb="\<Esc>[4%dm"
let &t_te="\<Esc>[?47l"
let &t_ti="\<Esc>[?47h"

" Rabl "
""""""""
augroup rabl_helpers
  autocmd!
  au BufRead,BufNewFile *.rabl setf ruby
  au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
  au BufRead,BufNewFile *.rabl hi def link rubyRabl Function
augroup END

"""""""""""
" PLUGINS "
"""""""""""
" Nerd Tree "
"""""""""""""
" noremap <c-n> :NERDTreeToggle<CR>

" Vim Indent Guides "
"""""""""""""""""""""
let g:indent_guides_auto_colors = 0
augroup indent_guides
  autocmd!
  au BufRead,BufNewFile * IndentGuidesEnable
augroup END
