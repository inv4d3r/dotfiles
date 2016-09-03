" let the pathogen work
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"

syntax on
filetype plugin on
filetype plugin indent on

set ofu=syntaxcomplete#Complete

set relativenumber
set number

" do not wrap overflowing characters, it's annoying
set nowrap
"set linebreak

" vim won't force to write changed buffer 
set hidden

" show current normal command in status line
set showcmd

" identation configuration
set shiftwidth=2
set tabstop=2
set expandtab

"colorscheme jellybeans
set background=dark
colorscheme gruvbox

" highlight search matches
set hlsearch
"hi Search ctermfg=None ctermbg=black

" current line highlight
hi CursorLine ctermbg=black ctermfg=None
set cursorline

" mksession options
set sessionoptions=buffers

set grepprg=grep\ -nH\ $*
set laststatus=2

""" Mappings "
map gf :e <cfile><cr>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTree<CR>
map <F4> :GundoToggle<CR>
map <F5> :Tagbar<CR>
map <F6> :TlistOpen<CR>

map <leader>t :call Toggle_task_status()<CR>

" silent make - no Enter prompt 
map <leader>m :silent make\|redraw!\|cw<CR>

" easy subverting
map <leader>s :S/

" tabs navigation (breaks unimpaired mappings for tag navigation)
nmap ]t :tabnext<CR>
nmap [t :tabprev<CR>

nmap <C-l> :silent nohl\|redraw<CR>

" search in MRU, buffers and FS
let g:ctrlp_cmd = 'CtrlPMixed'

" Latex configuration
let g:tex_flavor = "latex"

""" Airline configuration "
let g:airline_theme             = 'badwolf'
let g:airline#extensions#branch#enabled = 2
let g:airline#extensions#syntastic#enabled = 1

" vim-powerline symbols
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''
"let g:airline_symbols.branch    = ''
"let g:airline_symbols.readonly  = ''
"let g:airline_symbols.linenr    = ''


""" YCM configuration """
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


""" UltiSnips configuration """
let g:UltiSnipsExpandTrigger="<C-j>"

""" Signature colorize """
highlight SignatureMarkText ctermfg=205
