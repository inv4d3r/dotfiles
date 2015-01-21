function Tab_Or_Complete()
    return "\<C-N>"
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
    else
      return "\<Tab>"
    endif
endfunction
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
let &printexpr="(v:cmdarg=='' ? ".
    \"system('lpr' . (&printdevice == '' ? '' : ' -P' . &printdevice)".
    \". ' ' . v:fname_in) . delete(v:fname_in) + v:shell_error".
    \" : system('mv '.v:fname_in.' '.v:cmdarg) + v:shell_error)"
colorscheme jellybeans
syntax on
filetype plugin on
filetype indent plugin on
set ofu=syntaxcomplete#Complete
set number
set wrap
set linebreak
set showcmd
syntax on
set cursorline
"set cursorcolumn
"highlight CursorLine     ctermbg=8 guibg=background
"highlight CursorColumn   ctermbg=8 guibg=background
set shiftwidth=2
set tabstop=2
set expandtab
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set laststatus=2
map gf :e <cfile><cr>
map <C-n> :NERDTreeToggle<CR>
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-c> :bd<CR>
map <silent> <C-Tab> :tabnext<CR>
nnoremap <silent> <A-c> :tabclose<CR>
let g:airline_theme             = 'badwolf'
let g:airline_enable_branch     = 2
let g:airline_enable_syntastic  = 1
let g:airline#extensions#tabline#enabled = 1

" vim-powerline symbols
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = ''

"Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif

let loaded_bclose = 1

if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
echohl ErrorMsg
echomsg a:msg
echohl NONE
endfunction


 " Command ':Bclose' executes ':bd' to delete buffer in current window.
 " The window will show the alternate buffer (Ctrl-^) if it exists,
 " or the previous buffer (:bp), or a blank buffer if no previous.
 " Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
 " An optional argument can specify which buffer to close (name or number).
 function! s:Bclose(bang, buffer)

   if empty(a:buffer)
     let btarget = bufnr('%')
   elseif a:buffer =~ '^\d\+$'
     let btarget = bufnr(str2nr(a:buffer))
   else
     let btarget = bufnr(a:buffer)
   endif

   if btarget < 0
     call s:Warn('No matching buffer for '.a:buffer)
     return
   endif

   if empty(a:bang) && getbufvar(btarget, '&modified')
     call s:Warn('No write since last change for buffer '.btarget.' (use:Bclose!)')
     return
   endif

   " Numbers of windows that view target buffer which we will delete.
   let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
   if !g:bclose_multiple && len(wnums) > 1
     call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
     return
   endif

   let wcurrent = winnr()
   for w in wnums
     execute w.'wincmd w'

     let prevbuf = bufnr('#')
     if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
       buffer #
     else
       bprevious
     endif

     if btarget == bufnr('%')
       " Numbers of listed buffers which are not the target to be deleted.
       let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val !=btarget')
       " Listed, not target, and not displayed.
       let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
       " Take the first buffer, if any (could be more intelligent).
       let bjump = (bhidden + blisted + [-1])[0]
       if bjump > 0
         execute 'buffer '.bjump
       else
         execute 'enew'.a:bang
       endif
     endif

   endfor

   execute 'bdelete'.a:bang.' '.btarget
   execute wcurrent.'wincmd w'

 endfunction

 command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose('<bang>', '<args>')
 nnoremap <silent> <Leader>bd :Bclose<CR>
 nnoremap <silent> <Leader>bD :Bclose!<CR>
