call plug#begin() 
Plug 'preservim/NERDTree' 
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'https://github.com/ap/vim-css-color' 
Plug 'catppuccin/vim', {'as': 'catppuccin' }
Plug 'tpope/vim-commentary' 
call plug#end() 
let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#buffer_idx_mode = 1 
syntax on
set termguicolors
colorscheme sorbet
let g:airline_theme = 'catppuccin_mocha'

" For changing the cursor type in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

	" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Normal vim config
set number relativenumber
hi LineNr ctermfg=grey ctermbg=016 
set tabstop=4 
set shiftwidth=4 
set expandtab
set cursorline
set nobackup
set nowritebackup
set splitright
set splitbelow
set smartcase
set ignorecase
set incsearch
set showmatch
set hlsearch

:augroup numbertoggle
:	autocmd!
:	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu	| endif
:	autocmd BufLeave,FocusLost,InsertEnter,WinLeave	  * if &nu | set nornu	| endif
:augroup END

let c='a'
while c<='z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" Key-bindings
nnoremap <F5> :NERDTreeToggle<CR> 
" shift between buffers
nnoremap <leader><Right> :bp<CR> 
nnoremap <leader><Left> :bn<CR> 
" move between vsplit or split panels
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

inoremap jk <Esc>
nnoremap <leader>9 $
nnoremap <Esc>/ :noh<CR>

" nnoremap <C-Left> :bp<CR>
" nnoremap <C-Right> :bn<CR>

nmap <C-_> gcc 
vmap <C-_> gc
