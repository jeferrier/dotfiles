runtime! plugin/python_setup.vim
set runtimepath+=/usr/share/vim/vimfiles
syntax on
colorscheme germty
set number " Show numbers in the gutter
set tabstop=4 " Set the tab to 4 spaces wide
set shiftwidth=4 " Not 100% on this, but keep it for tabbing
set noexpandtab " This forces tabs to be used instead of spaces
" set colorcolumn=80 " This will set a 'ruler' column at 80
set laststatus=2 " This is for the light/powerline to show statuses
set lcs=tab:-_,trail:~ " Set our desired whitespace characters
set list
set relativenumber
set dir=~/.vim/swaps " This sets the location that edited file swaps are saved (prevents local dir clutter)

" Below is from Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/vim/bundle/plugins')

" Vundle must manage itself as a plugin
Plugin 'VundleVim/Vundle.vim'
" User plugins here
Plugin 'joshdick/onedark.vim' " color scheme
Plugin 'airblade/vim-gitgutter' "git in the gutter
Plugin 'junegunn/fzf' " Adds fuzzy file searching
" Plugin 'cloudhead/neovim-fuzzy'
Plugin 'scrooloose/syntastic' " Adds a syntak checker
Plugin 'itchyny/lightline.vim' " Adds powerline to bottom of vim

call vundle#end()
filetype plugin indent on
" source ~/.config/nvim/nvim-fzy.vim

" Additional setting for user plugins
let g:syntastic_javascript_checkers=['eslint']

" Key remapping
nnoremap <F1> :tabp<cr> " This makes it possible to change tabs with F1 and F2
nnoremap <F2> :tabn<cr>
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

nnoremap <C-n> :set relativenumber!<cr>
nnoremap <C-p> :call fzf#run({'sink': 'tabedit'})<cr>
nnoremap <F5> "=strftime("%H:%M %D")<cr>P

tnoremap <esc><esc> <C-\><C-n>
" Scripts and commands
autocmd BufWritePre * %s/\s\+$//e

" Place settings here that get reset during Vundle stuff
set noshowmode " This hides the default status bar
