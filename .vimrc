"Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'zxqfl/tabnine-vim'
call vundle#end()
filetype plugin indent on

"Tabbing
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set softtabstop=4
set backspace=indent,eol,start

"Casing
set ignorecase
set infercase

"Display Info
set number
set cursorline
set cursorcolumn
set relativenumber
set ruler

"Yank/Paste to System Clipboard
noremap <leader>y "*y
noremap <leader>p "*p

"Misc
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>v :tabe ~/.vimrc<CR>
set dictionary=/usr/share/dict/words
nnoremap L gt
nnoremap H gT
map <space> <leader>

"Support <C-j> and <C-k> to swap adjacent lines
function! SwapDown()
    if line('$') > 1
        let pos = getpos('.')
        if pos[1] != getpos('$')[1]
            m +1
            let pos[1] += 1
            call setpos('.', pos)
        endif
    endif
endfunction

function! SwapUp()
    if line('$') > 1
        let pos = getpos('.')
        if pos[1] != 1
            m -2
            let pos[1] -= 1
            call setpos('.', pos)
        endif
    endif
endfunction

nnoremap <silent> <C-j> :call SwapDown()<CR>
nnoremap <silent> <C-k> :call SwapUp()<CR>

"VimWiki
set nocompatible
filetype plugin on
syntax on
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
call plug#end()
let g:vimwiki_list = [{'path': '~/Desktop/notes', 'list_margin': 2}]
au BufNewFile,BufFilePre,BufRead, *.wiki set nowrap linebreak textwidth=72
function! VimWikiFormat()
    if &ft == 'vimwiki'
        let pos = getpos('.')
        exec "normal gggqGgg"
        :%s/=.\{-}= /&\r/ge
        exec "normal gg"
        :%s/\[\[.\{-}\]\] /&\r/ge
        exec "normal gg"
        call setpos('.', pos)
    endif
endfunction
nnoremap <silent> <leader>f :silent call VimWikiFormat()<CR>
nnoremap <silent> <leader>t :VimwikiTOC<CR>

"Experimental
"function! ToggleFever()
"    if !exists('b:fever')
"        let b:fever=1
"        echo "-- FEVER MODE --"
"    else
"        unlet b:fever
"        echo ""
"    endif
"endfunction
"nnoremap <silent> <leader>x :call ToggleFever()<CR>
"
"highlight Alert ctermbg=red
"function! ToggleAlert()
"    if !exists('b:fever_alert')
"        let b:fever_alert=1
"        match Alert ".*"
"    else
"        unlet b:fever_alert
"        match Alert //
"    endif
"endfunction
"nnoremap <silent> a exists('b:fever') ? ':call ToggleAlert()<CR>' : 'a'
"nnoremap <silent> o exists('b:fever') ? 'O' : 'o'

