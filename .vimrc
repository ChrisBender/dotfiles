"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'zxqfl/tabnine-vim'
call vundle#end()            " required
filetype plugin indent on    " required

"Misc
set number
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>v :tabe ~/.vimrc<CR>
set dictionary=/usr/share/dict/words
nnoremap \yeet :echo "Ye yeeet"<CR>
nnoremap L gt
nnoremap H gT

"Text formatting for vimwiki
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

"Tabbing
set tabstop=4
set shiftwidth=4
set expandtab
retab
set autoindent
set softtabstop=4

set backspace=indent,eol,start

"For vimwiki
set nocompatible
filetype plugin on
syntax on
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
call plug#end()
let g:vimwiki_list = [{'path': '~/Desktop/notes', 'list_margin': 2}]

"Casing
set ignorecase
set infercase

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

