" Vim settings
set shell=zsh\ -l

" Of course
set nocompatible

" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on
" ====================================
" General vim settings
" ====================================
" enable help docs
Helptags

" Allow the use of the mouse in vim
set mouse=a

"Disable .swp files
set noswapfile

" set the ruler to display cursor position on
set ruler

" set syntax highlighting on
syntax on

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" remove 4 spaces as if it were a tab
set softtabstop=4

" show a visual line under the cursor's current line 
set cursorline

" enable all Python syntax highlighting features
let python_highlight_all = 1

" show the matching part of the pair for [] {} and ()
set showmatch

" 
set nu
            
" Set numbers to display relative to current cursor position in the file
set relativenumber

" Ignore case when using search
set ignorecase

" Show search result before moving to it
set incsearch

" ====================================
" Solarized settings
" ====================================
" Set to the dark solarized colour scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
set t_Co=256                        " force vim to use 256 colors
" ====================================
" NerdTree Settings
" ====================================
"Fix nerdtree arrow problems
let g:NERDTreeDirArrows=0

" ====================================
" Airline settings 
" ====================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"Remove seperators and makes airline look cleaner
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
" Show airline even when only one file is open
set laststatus=2
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" ====================================
" Closetag for HTML settings...
" ====================================

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako set smarttab

" ====================================
" Pymode setting
" ====================================

let g:pymode_options = 1

" Disable automatic folding of classes and functions
let g:pymode_folding = 0

" Set the maximum line length before wrapping text
let g:pymode_options_max_line_length = 79

" Set the display of a coloured column to represent the maximum line length
" location
let g:pymode_options_colorcolumn = 0

" Turn indenting on
let g:pymode_indent = 1

" Don't check for errors every time a file is written
let g:pymode_lint_on_write = 0

" Turn linting off
let g:pymode_lint = 0

" Turn syntax highlighting on
let g:pymode_syntax = 1

" Disable rope due to hanging bug
let g:pymode_rope = 0

" Enable all extra syntax highlighting options
let g:pymode_syntax_all = 1

" ====================================
" ProSession Settings
" ====================================
let g:prosession_tmux_title = 1
let g:prosession_load_on_startup = 1

" ====================================
" Syntastic
" ====================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1

" Check for errors when opening a new file
let g:syntastic_check_on_open = 1

" Don't check for errors if quiting after writing
let g:syntastic_check_on_wq = 0

" Set the checkers to be used for finding syntax errors
let g:syntastic_python_checkers = ['pyflakes']

" Function for toggling the error window
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

let g:syntastic_auto_loc_list = 0

" Run all checkers and then create list of errors rather than showing error
" lists individually
let g:syntastic_aggregate_errors = 1

" Set JavaScript syntax checkers
let g:syntastic_javascript_checkers = ['jshint']

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set conceallevel=2
set concealcursor=vin

" Complete options (disable preview scratch window, longest removed to aways
" show menu)
set completeopt=preview,preview

" Limit popup menu height
set pumheight=20"

" ====================================
" Custom key bindings
" ====================================
" Disable arrow keys
map <Up>    <nop>
map <Down>  <nop>
map <Left>  <nop>
map <Right> <nop>

" Set space as leader key
map <Space> <Leader>

" Backspace over tabs properly (I think...)
set backspace=indent,eol,start

" Show commands used in the botom right
set showcmd

" Activate/deactivate the Tagbar 
nmap <F8> :TagbarToggle<CR>

" Map the error window toggle to <F6>
nmap <F6> :call ToggleErrors()<CR><CR>

" Map PyMode linting shortcut
nmap <leader>pl :PymodeLint<CR>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd! #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Toggle the NerdTree file browser menu
nmap <F7> :NERDTreeToggle<CR>

nmap <leader>o :Obsess<CR>

" Copy too and from the system clipboard with standard yank and paste commands
" but with leader
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Enter visual line by hitting leader twice
nmap <Leader><Leader> V

" Map v to use expand-region plugin for selecting char, then word, then
" paragraph 
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Use enter to jump to line number/end of file
nnoremap <CR> G
" Use backspace go to begining of file
nnoremap <BS> gg

" Stop strange window from popping up when accidentally press q:
map q: :q

" Navigate vim windows with hjkl
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" ====================================

" Source local vim script for the current machine
" (Keep this at bottom to overwrite configs above with system specific
" configs)
if filereadable(expand("./vimrc.local"))
    source ./vimrc.local
endif

