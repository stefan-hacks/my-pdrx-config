" ============================================================================
" CORE SETTINGS
" ============================================================================

" Enable modern Vim features
set nocompatible        " Use Vim defaults instead of Vi compatibility
filetype plugin indent on " Auto-detect filetypes and load corresponding plugins

" Leader key - like in LazyVim
let mapleader = " "     " Space as leader key
let maplocalleader = "\\" " Backslash as local leader

" ============================================================================
" COLOR SCHEME - SYNC WITH KITTY TERMINAL
" ============================================================================

" Detect Kitty terminal and use its colors
if $TERM =~ 'xterm-kitty'
    " Enable true color support
    set termguicolors
    " Fix background color erase issue in some terminals
    let &t_ut=''
    " Use the terminal's color palette (makes Vim respect Kitty's colors)
    colorscheme default
endif

" ============================================================================
" VISUAL APPEARANCE (LazyVim-like UI)
" ============================================================================

syntax enable           " Enable syntax highlighting
set termguicolors       " Enable true color support (if terminal supports it)
" set background=dark     " Dark background

" Line numbers (hybrid mode like LazyVim)
set number              " Show line numbers
set relativenumber      " Show relative line numbers (easier navigation)

" Cursor and line highlighting
" set cursorline          " Highlight current line
set scrolloff=5         " Keep 5 lines above/below cursor when scrolling
set sidescrolloff=5     " Keep 5 columns left/right when horizontal scrolling

" Window appearance
set showcmd             " Show command in bottom bar
set showmode            " Show current mode
set ruler               " Show cursor position
set laststatus=2        " Always show status line

" Tab and status line formatting
set wildmenu            " Visual autocomplete for command menu
set showtabline=2       " Always show tab line

" ============================================================================
" EDITING EXPERIENCE
" ============================================================================

" Indentation (intelligent autoindent like LazyVim)
set autoindent          " Copy indent from current line
set smartindent         " Do smart autoindenting
set expandtab           " Use spaces instead of tabs
set tabstop=4           " Number of spaces that a <Tab> counts for
set shiftwidth=4        " Number of spaces to use for autoindent
set softtabstop=4       " Number of spaces that a <Tab> counts for while editing

" Text rendering
set linebreak           " Break lines at word boundaries
set wrap                " Wrap long lines
set textwidth=80        " Maximum width of text
" set colorcolumn=80      " Show vertical line at 80 characters

" Clipboard integration
set clipboard=unnamedplus " Use system clipboard (if supported)

" Undo and backup
set undofile            " Persistent undo
set undodir=~/.vim/undo " Undo file directory
set backup              " Enable backups
set backupdir=~/.vim/backup " Backup directory
set directory=~/.vim/swap   " Swap file directory

" ============================================================================
" SEARCH AND NAVIGATION
" ============================================================================

" Search settings
set ignorecase          " Case insensitive searching
set smartcase           " Case sensitive when search contains uppercase
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

" Navigation
set whichwrap+=<,>,h,l  " Allow cursor to wrap to next/previous line
set virtualedit=block   " Allow cursor to move where there's no text in block mode

" Mouse support (optional)
set mouse=a             " Enable mouse in all modes

" ============================================================================
" KEY MAPPINGS (LazyVim-inspired)
" ============================================================================

" Clear search highlight with Esc
nnoremap <silent> <Esc> :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows with arrow keys
nnoremap <silent> <Leader><Left> :vertical resize -5<CR>
nnoremap <silent> <Leader><Right> :vertical resize +5<CR>
nnoremap <silent> <Leader><Up> :resize +5<CR>
nnoremap <silent> <Leader><Down> :resize -5<CR>

" Buffer navigation
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprevious<CR>
nnoremap <silent> <Leader>bd :bdelete<CR>
nnoremap <silent> <Leader>bl :buffers<CR>

" Tab navigation
nnoremap <silent> <Leader>tn :tabnew<CR>
nnoremap <silent> <Leader>to :tabonly<CR>
nnoremap <silent> <Leader>tc :tabclose<CR>
nnoremap <silent> <Leader>th :tabprevious<CR>
nnoremap <silent> <Leader>tl :tabnext<CR>

" Quick save and quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" Select all
nnoremap <Leader>a ggVG

" Copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>Y "+yg_
nnoremap <Leader>y "+y

" Paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

" Quick editing of vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Toggle settings
nnoremap <silent> <Leader>tn :set relativenumber!<CR>
nnoremap <silent> <Leader>tw :set wrap!<CR>
nnoremap <silent> <Leader>ts :set spell!<CR>

" Search mappings
nnoremap <Leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>
nnoremap <Leader>* *<C-O>:%s///gn<CR>

" ============================================================================
" COMMAND-LINE ENHANCEMENTS
" ============================================================================

" Command-line completion
set wildmode=list:longest,full  " Complete like a shell
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png  " Ignore these files

" Command history
set history=1000

" ============================================================================
" AUTOCOMMANDS
" ============================================================================

" Create directories if they don't exist
silent !mkdir -p ~/.vim/undo
silent !mkdir -p ~/.vim/backup
silent !mkdir -p ~/.vim/swap

" Auto-reload vimrc when saved
augroup vimrc_reload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Filetype-specific settings
augroup filetype_settings
    autocmd!
    
    " Python files
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
    
    " JavaScript/TypeScript files
    autocmd FileType javascript,typescript setlocal tabstop=2 shiftwidth=2 expandtab
    
    " HTML/CSS files
    autocmd FileType html,css setlocal tabstop=2 shiftwidth=2 expandtab
    
    " Markdown files
    autocmd FileType markdown setlocal wrap linebreak textwidth=80
    
    " Git commit messages
    autocmd FileType gitcommit setlocal spell textwidth=72
    
    " Shell scripts (like your original)
    autocmd BufRead,BufNewFile *.sh,*.bash set filetype=sh
    autocmd FileType sh setlocal tabstop=8 shiftwidth=4 expandtab
augroup END

" Restore cursor position
augroup restore_cursor
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   execute "normal! g`\""
        \ | endif
augroup END

" Auto-save on focus loss
augroup autosave
    autocmd!
    autocmd FocusLost * silent! wall
augroup END

" ============================================================================
" CUSTOM FUNCTIONS (LazyVim-like utilities)
" ============================================================================

" Toggle between absolute and relative line numbers
function! ToggleLineNumbers()
    if &relativenumber
        set norelativenumber
        echo "Absolute line numbers"
    else
        set relativenumber
        echo "Relative line numbers"
    endif
endfunction
nnoremap <silent> <Leader>un :call ToggleLineNumbers()<CR>

" Clear trailing whitespace
function! CleanWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
    echo "Trailing whitespace removed"
endfunction
nnoremap <silent> <Leader>cw :call CleanWhitespace()<CR>

" Toggle paste mode
function! TogglePaste()
    if &paste
        set nopaste
        echo "Paste mode off"
    else
        set paste
        echo "Paste mode on"
    endif
endfunction
nnoremap <silent> <Leader>up :call TogglePaste()<CR>

" ============================================================================
" CUSTOM STATUS LINE (No Powerline dependency)
" ============================================================================

" Define mode-specific colors
let g:mode_colors = {
            \ 'n': 'Blue',
            \ 'i': 'Green', 
            \ 'v': 'Red',
            \ 'V': 'Red',
            \ "\<C-V>": 'Magenta',
            \ 'c': 'Yellow',
            \ 't': 'Cyan'
            \ }

" Function to get current mode color
function! GetModeColor()
    let l:mode = mode()
    " Handle visual block mode (^V)
    if l:mode ==# "\<C-V>"
        return get(g:mode_colors, "\<C-V>", 'White')
    endif
    return get(g:mode_colors, l:mode, 'White')
endfunction

" Function to display mode text
function! StatuslineMode()
    let l:mode = mode()
    if l:mode == "n"
        return "NORMAL"
    elseif l:mode == "i"
        return "INSERT"
    elseif l:mode == "v"
        return "VISUAL"
    elseif l:mode == "V"
        return "V-LINE"
    elseif l:mode == "\<C-V>"
        return "V-BLOCK"
    elseif l:mode == "c"
        return "COMMAND"
    elseif l:mode == "t"
        return "TERMINAL"
    else
        return l:mode
    endif
endfunction

" Define highlight groups for each mode
function! DefineModeHighlights()
    for [mode, color] in items(g:mode_colors)
        " Left end cap highlight
        execute 'highlight ' . color . 'Left ctermbg=' . tolower(color) . ' ctermfg=White guibg=' . tolower(color) . ' guifg=White'
        " Right end cap highlight
        execute 'highlight ' . color . 'Right ctermbg=' . tolower(color) . ' ctermfg=White guibg=' . tolower(color) . ' guifg=White'
    endfor
endfunction

" Dynamic status line function
function! DynamicStatusLine()
    let l:mode_color = GetModeColor()
    let l:status = ''
    
    " Left colored end cap (using simple characters)
    let l:status .= '%#' . l:mode_color . 'Left#'
    let l:status .= '│'
    
    " Main content
    let l:status .= '%#Normal#'
    let l:status .= ' %{StatuslineMode()} '
    let l:status .= '%t'
    let l:status .= '%m'
    let l:status .= '%r '
    
    " Right align
    let l:status .= '%='
    
    " Right side content
    let l:status .= '%y '
    let l:status .= '%{&fileencoding?&fileencoding:&encoding}'
    let l:status .= '[%{&fileformat}] '
    let l:status .= '%p%% %l:%c '
    
    " Right colored end cap
    let l:status .= '%#' . l:mode_color . 'Right#'
    let l:status .= '│'
    
    return l:status
endfunction

" Setup the custom status line
function! SetupCustomStatusLine()
    " Set up highlights
    call DefineModeHighlights()
    
    " Set the dynamic status line
    set statusline=%!DynamicStatusLine()
    
    " Set minimal highlight to use terminal defaults
    highlight StatusLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight StatusLineNC cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
    highlight Normal ctermbg=NONE ctermfg=NONE
endfunction

" Initialize the status line
call SetupCustomStatusLine()

" ============================================================================
" SIMPLE POWERLINE-LIKE STATUS LINE ALTERNATIVE
" ============================================================================

" Alternative: If you want to try lightline.vim (lighter alternative)
" Uncomment these lines to try it:
" let g:lightline = {
"   \ 'colorscheme': 'wombat',
"   \ 'active': {
"   \   'left': [ ['mode', 'paste'],
"   \             ['readonly', 'filename', 'modified'] ],
"   \   'right': [ ['lineinfo'],
"   \              ['percent'],
"   \              ['fileformat', 'fileencoding', 'filetype'] ]
"   \ },
"   \ 'component': {
"   \   'readonly': '%{&readonly?"":""}',
"   \ },
"   \ 'separator': { 'left': '', 'right': '' },
"   \ 'subseparator': { 'left': '', 'right': '' }
"   \ }

" To use lightline, install it first:
" git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline

" ============================================================================
" YOUR ORIGINAL SETTINGS (preserved)
" ============================================================================

" Your original toggle search highlight (now also mapped to Esc)
nmap <F3> :set hlsearch!<CR>

" ============================================================================
" FINAL SETTINGS
" ============================================================================

" Enable filetype detection for shell scripts
let g:is_bash = 1

" Improve performance
set lazyredraw          " Don't redraw during macros
set ttyfast             " Faster redrawing

" Security
set modelines=0         " Disable modelines for security
set nomodeline          " Disable modelines

" Completion
set completeopt=menuone,longest " Better completion

" Bell off
set noerrorbells        " Disable error bells
set visualbell          " Use visual bell instead of beeping
set t_vb=               " Disable visual bell
