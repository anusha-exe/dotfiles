call plug#begin() 
Plug 'preservim/NERDTree' 
Plug 'vim-airline/vim-airline' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'https://github.com/ap/vim-css-color' 
Plug 'tpope/vim-commentary' 
call plug#end() 
let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#buffer_idx_mode = 1 

" For changing the cursor type in different modes
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

	" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" Normal vim config
set number 
hi LineNr ctermfg=grey ctermbg=016 
set tabstop=4 
set shiftwidth=4 
" Key-bindings
nnoremap <F5> :NERDTreeToggle<CR> 
nnoremap <C-Left> :bp<CR> 
nnoremap <C-Right> :bn<CR> 
inoremap ii <Esc>
nmap <C-_> gcc 
vmap <C-_> gc
