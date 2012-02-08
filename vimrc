" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Use pathogen for plugin management
call pathogen#infect()
call pathogen#helptags()

set showcmd     " show incomplete cmds down the bottom
set showmode    " show current mode down the bottom

set incsearch   " find the next match as we type the search
set hlsearch    " highlight searches by default

set nowrap " do not wrap text

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Options for minibufexpl
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Indents and spacing
set tabstop=4
set shiftwidth=4
set noexpandtab
set smartindent

" Visuals
set ruler
set number
set list
set listchars=tab:\|·,eol:$,trail:·,extends:>,precedes:<

" Insert the current branch from fugitive onto the statusline
set statusline=%<%f\ %{fugitive#statusline()}\ %h%m%r%=%-14.(%l,%c%V%)\ %P

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" key mapping for windows navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3     "deepest fold is 3 levels
set nofoldenable      "dont fold by default

" open / close a reference window
nnoremap <F1> :call ToggleVimReference()<CR>

let g:vim_reference_file = "~/.vim-reference"
let g:vim_reference_width = 45

function! ToggleVimReference()
    if !exists("s:vim_reference_open") || s:vim_reference_open == 0
        let s:vim_reference_open = 1
        execute "botright vnew " . g:vim_reference_file
        execute "vertical resize " . g:vim_reference_width
    else
        update
        execute "bdelete " . g:vim_reference_file
        let s:vim_reference_open = 0
    endif
endfunction

" map F4 to TlistToggle
map <F4> :TlistToggle<CR>

" remap for smart buffer delete
nnoremap <silent> <leader>bd    :Sbd<CR>
nnoremap <silent> <leader>bdm   :Sbdm<CR>
