set shell=bash\ -i

" Allow the use of the mouse in vim
set mouse=a

filetype plugin indent on
execute pathogen#infect()
" enable help docs
Helptags

" Set to the dark solarized colour scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" set the ruler to display cursor position on
set ruler

" show line numbers
set number

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

" show a visual line under the cursor's current line 
set cursorline

" enable all Python syntax highlighting features
let python_highlight_all = 1

" show the matching part of the pair for [] {} and ()
set showmatch

" Activate/deactivate the Tagbar 
nmap <F8> :TagbarToggle<CR>

"AIRLINE/BUFFER MANAGEMENT
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>t :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"closetag for HTML settings...
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" Pymode setting
let g:pymode_options = 1
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint = 1

" map linting shortcut
nmap <leader>li :PymodeLint<CR>
