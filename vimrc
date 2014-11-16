"
"                    .vimrc by Dmitry Nets
"
"            When you want to instruct, be brief.
"                                             - Cicero
"                      Table of Contents:
"
" VIMRCTOC........Table Of Contents / END OF .vimrc
" VIMRC010........General settings
" VIMRC020........User interface
" VIMRC030........Indentation settings
" VIMRC040........Macros
" VIMRC04a........Save & Session macros
" VIMRC04c........Edit, Yank, Put macros
" VIMRC04d........Search & Replace macros
" VIMRC04e........Window macros
" VIMRC04f........Buffer macros
" VIMRC04g........Tab macros
" VIMRC04h........Spellcheck macros
" VIMRC050........Helper functions
" VIMRC060........Plugins, plugin settings & macros
"
"                        Plugins used:
"
" Vundle (plugin manager)
" conque-shell (run interactive commands inside a Vim buffer)
" Trinity (manages Taglist, Source Explorer and NERDtree)
" Source Explorer (explore definitions)
" taglist (list tags in window, requires exuberant ctags)
" easytags (automated tag file generation and syntax highlighting)
" vim-misc (scripts used by easytags)
" NERDTree (tree explorer plugin)
" vim-airline (fancy status/tabline)
" powerline-fonts (font pack with powerline char support)
" fugitive.vim (git wrapper)
" vim-gitgutter (adds git diff to gutters)
" syntastic (syntax checking with error display)
" bufferline (shows buffers in status line)
" better-whitespace (whitespace highlighting and removal)
" ruscmd (control basic vim functions on cyrillic layout)
" vim-pencil (vim for writing)
" SuperTab (insert mode completion)
" UltiSnips (snippet engine)
" vim-snippets (snippet collection)
"
"--------------------------------------------------------------
" VIMRC010            General settings
"--------------------------------------------------------------

" Enable improved mode
set nocompatible

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Disable backup and swap file
set nobackup
set nowb
set noswapfile

" Sets working directory to current directory
set autochdir

" Disable timeout for stringing commands
set notimeout
set ttimeout

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

"--------------------------------------------------------------
" VIMRC020               User Interface
"--------------------------------------------------------------

set t_Co=256

" Terminal color scheme
colorscheme molokai

" Set options when running in GUI mode
if has("gui_running")
    set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 10
    " Hide toolbar
    set guioptions-=T
    set guioptions+=e
    set guitablabel=%M\ %t
endif

" Turn on line numbers
set number

" Don't wrap lines
set nowrap

" Turn on the WiLd menu
set wildmenu

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Linebreak on 500 characters
set lbr
set tw=500

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"--------------------------------------------------------------
" VIMRC030           Indentation settings
"--------------------------------------------------------------

" Use spaces instead of tabs
set expandtab

" Set smart tab
set smarttab

" Set tab width
set shiftwidth=4
set tabstop=4

" Auto indent
set ai

" Smart indent
set si

"--------------------------------------------------------------
" VIMRC040                  Macros
"--------------------------------------------------------------

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Set mapleader to be used in macros to <space>
let mapleader=' '
let g:mapleader=' '

" Set 2nd mapleader (used for coding-related macros)
let maplocalleader =','
let g:maplocalleader =','

"--------------------------------------------------------------
" VIMRC04a         Save & Session macros
"--------------------------------------------------------------

" Save session
noremap <leader><leader>s :mksession! ~/vim_session<CR>

" Load session
noremap <leader><leader>l :source ~/vim_session<CR>

" Switch buffer to readonly
noremap <localleader><localleader>r :setlocal ro!<CR>

" Write current buffer
nnoremap <leader>w :w!<CR>

" Update current buffer
nnoremap <leader>u :up<CR>

" Quit all buffers, tabs and splits NORMALLY
nnoremap <leader><leader><leader>q :qa<CR>

" Quit all buffers, tabs and splits WITHOUT SAVING
nnoremap <leader><leader><leader>z :qa!<CR>

" Quit all buffers, tabs and splits AND SAVE
nnoremap <leader><leader><leader>w :wqa!<CR>

"--------------------------------------------------------------
" VIMRC04c      Edit, Copy, Paste macros
"--------------------------------------------------------------

" Map ' to " for easier register access
noremap ' "

" Show registers
nnoremap <leader><leader>r :reg<CR>

" Yank selection to system clipboard in VISUAL MODE
vnoremap <C-c> "+y

" Yank word to system clipboard in NORMAL MODE
nnoremap <C-c> "+yiw

" Put from system clipboard in VISUAL MODE
vnoremap <C-v> "+p

" Put from system clipboard in NORMAL MODE
nnoremap <C-v> "+P

" Put from system clipboard in INSERT MODE
inoremap <C-v> <Esc>"+pa

" Treat long lines as break lines
noremap j gj
noremap k gk

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-j> mz:m+<CR>`z
nnoremap <M-k> mz:m-2<CR>`z
vnoremap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nnoremap <D-j> <M-j>
  nnoremap <D-k> <M-k>
  vnoremap <D-j> <M-j>
  vnoremap <D-k> <M-k>
endif

"--------------------------------------------------------------
" VIMRC04d        Search & Replace macros
"--------------------------------------------------------------

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Disable highlight when <leader><CR> is pressed
noremap <silent> <leader><CR> :noh<CR>

"--------------------------------------------------------------
" VIMRC04e            Window macros
"--------------------------------------------------------------

" Move between windows with <leader>hjkl
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>h <C-W>h
noremap <leader>l <C-W>l

" Window shortcuts
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>o :only<CR>
noremap <leader><leader>q :quit<CR>

"--------------------------------------------------------------
" VIMRC04f            Buffer macros
"--------------------------------------------------------------

" Next buffer
nnoremap ; :bn<CR>

" Previous buffer
nnoremap <leader>; :bp<CR>

" Display buffers
nnoremap <leader><leader>b :ls<CR>

" New [No Name] buffer in current window
nnoremap <leader>n :enew<CR>

" Delete current buffer
nnoremap <leader>q :bp\|bd! #<CR>

" Close all the buffers
noremap <leader>bad :1,1000 bd!<CR>

" Switch CWD to the directory of the open buffer
noremap <leader>bcd :cd %:p:h<CR>:pwd<CR>

"--------------------------------------------------------------
" VIMRC04g             Tab macros
"--------------------------------------------------------------

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<CR>
noremap <leader>to :tabonly<CR>
noremap <leader>tq :tabclose<CR>
noremap <leader>tm :tabmove<CR>
noremap <leader>td :tab split<CR>

" Use gr to switch to previous tab
noremap gr gT

" Opens a new tab with the current buffer's path
noremap <leader>te :tabedit <C-r>=expand("%:p:h")<CR>

"--------------------------------------------------------------
" VIMRC04h         Spellcheck macros
"--------------------------------------------------------------

" Toggle spell checking
noremap <leader>z :setlocal spell!<CR>

" Next word
noremap <leader>zn ]s

" Previous word
noremap <leader>zp [s

" Add to dictionary
noremap <leader>za zg

" Correction
noremap <leader>z? z=

"--------------------------------------------------------------
" VIMRC050          Helper functions
"--------------------------------------------------------------

" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening file
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

"--------------------------------------------------------------
" VIMRC060     Plugins, plugin settings & macros
"--------------------------------------------------------------
"                           Vundle
"--------------------------------------------------------------

" Turn off filetype detection
filetype off

" Set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize Vundle in default directory
call vundle#begin() " or vundle#begin('~/some/path/here')

" Register plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'Conque-Shell'
Plugin 'wesleyche/Trinity'
Plugin 'wesleyche/srcexpl'
Plugin 'taglist.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'lokaltog/powerline-fonts'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'reedes/vim-pencil'
Plugin 'ervandew/supertab'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

" Call end function
call vundle#end()

" Load plugin flies for specific file types
" Required to be here to Vundle to work properly
filetype plugin indent on

"--------------------------------------------------------------
"                        Conque-Shell
"--------------------------------------------------------------

" Enable fast mode (no colors etc)
let g:ConqueTerm_FastMode = 0

" Enable session support
let g:ConqueTerm_SessionSupport=1

" Keep updating terminal buffer
let g:ConqueTerm_ReadUnfocused=1

" Open bash in current window using current buffer's CWD
nnoremap <leader><leader>t :ConqueTerm bash<CR>

"--------------------------------------------------------------
"                          Trinity
"--------------------------------------------------------------

" Toggle Tag List, Source Explorer & NERDTree
nnoremap <localleader><localleader>a :TrinityToggleAll<CR>

"--------------------------------------------------------------
"                      Source Explorer
"--------------------------------------------------------------

" Toggle Source Explorer
nnoremap <localleader><localleader>s :TrinityToggleSourceExplorer<CR>

" Set the height of Source Explorer window
let g:SrcExpl_winHeight=5

" Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime=100

" Map key to jump into the exact definition context
" let g:SrcExpl_jumpKey=<localleader><ENTER>"

" Map key for back from the definition context
let g:SrcExpl_gobackKey='<c-[>'

" List of buffer-using plugins by buffer name to avoid conflicts
let g:SrcExpl_pluginList=[ "__Tag_List__", "_NERD_tree_", ]

" Enable the local definition searching
let g:SrcExpl_searchLocalDef=1

" Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags=0

" Command to update tags
" let g:SrcExpl_updateTagsCmd = ctags --sort=foldcase -R ."

" Map updating the tags file artificially
" let g:SrcExpl_updateTagsKey = <localleader><localleader>u"

" Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey='<localleader>['

" Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey='<localleader>]'

"--------------------------------------------------------------
"                          Tag List
"--------------------------------------------------------------

" Toggle Tag List
nnoremap <localleader><localleader>t :TrinityToggleTagList<CR>

" Set default tag directory
set tags=./tags;

"--------------------------------------------------------------
"                        vim-easytags
"--------------------------------------------------------------

" Sync tags in background
let g:easytags_async=1

"--------------------------------------------------------------
"                          NERDTree
"--------------------------------------------------------------

" Toggle NERDTree
nnoremap <localleader><localleader>n :TrinityToggleNERDTree<CR>

" Define g:NERDTreeDirArrows
let g:NERDTreeDirArrows=1

"--------------------------------------------------------------
"                        vim-airline
"--------------------------------------------------------------

" Set theme
let g:airline_theme='dark'

" Use powerline fonts
let g:airline_powerline_fonts=1

" Enable tabline extension
let g:airline#extensions#tabline#enabled=1

" Enable/disable bufferline
let g:airline#extensions#bufferline#enabled=0

" Enable/disable Syntastic integration
let g:airline#extensions#syntastic#enabled=1

" Enable/disable fugitive/lawrencium integration
let g:airline#extensions#branch#enabled=1

" Change the text for when no branch is detected
let g:airline#extensions#branch#empty_message=''

" Use vcscommand.vim if available
let g:airline#extensions#branch#use_vcscommand=0

" Truncate long branch names to a fixed length
let g:airline#extensions#branch#displayed_head_limit=10

" Enable/disable whitespace extension
let g:airline#extensions#whitespace#enabled=0

" Statusline integration
let g:bufferline_echo=0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
  \ .bufferline#get_status_string()

"--------------------------------------------------------------
"                      better-whitespace
"--------------------------------------------------------------

" Change whitespace color
highlight ExtraWhitespace ctermbg=8

" Delete trailing whitespace
noremap <localleader><localleader><localleader>w :StripWhitespace<CR>

" Toggle whitespace highlighting
noremap <localleader><localleader>w :ToggleWhitespace<CR>

"--------------------------------------------------------------
"                         vim-pencil
"--------------------------------------------------------------

" Support for desired filetypes
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Toggle pencil
noremap <leader><leader>pp :PencilToggle<CR>

" Enable hard line break mode
noremap <leader><leader>ph :PencilHard<CR>

" Enable soft line break mode
noremap <leader><leader>ps :PencilSoft<CR>

" Enable soft line break mode
noremap <leader><leader>pf :PFormatToggle<CR>

" Set default textwidth
let g:pencil#textwidth=60

"--------------------------------------------------------------
"                         UltiSnips
"--------------------------------------------------------------

" Expand snippet
let g:UltiSnipsExpandTrigger = "<s-tab>"

" List snippets
let g:UltiSnipsListSnippets = "<C-tab>"

"--------------------------------------------------------------
" VIMRCTOC              END OF .vimrc
"--------------------------------------------------------------
