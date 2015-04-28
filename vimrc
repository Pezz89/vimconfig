" Vim settings
set shell=bash\ -i
" Allow the use of the mouse in vim
set mouse=a
filetype plugin indent on
execute pathogen#infect()
" enable help docs
Helptags
"Disable .swp files
set noswapfile
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


" Solarized settings
" Set to the dark solarized colour scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized


" Activate/deactivate the Tagbar 
nmap <F8> :TagbarToggle<CR>


" NerdTree Settings
nmap <F7> :NERDTreeToggle<CR>
"Fix nerdtree arrow problems
let g:NERDTreeDirArrows=0


"Airline settings 
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


"Closetag for HTML settings...
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako set smarttab


" Pymode setting
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
" map linting shortcut
nmap <leader>pl :PymodeLint<CR>


" Syntastic
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
" Map the error window toggle to <F6>
nmap <F6> :call ToggleErrors()<CR><CR>
let g:syntastic_auto_loc_list = 0
" Run all checkers and then create list of errors rather than showing error
" lists individually
let g:syntastic_aggregate_errors = 1

" Disable arrow keys
map <Up>    <nop>
map <Down>  <nop>
map <Left>  <nop>
map <Right> <nop>
