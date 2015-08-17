set nocompatible

" Add some plugins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'chase/vim-ansible-yaml'
Plug 'jtratner/vim-flavored-markdown'
call plug#end()

" Disable F1 for help screen - I open this accidentally all the time!
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Use 2 spaces for tabs
set shiftwidth=2
set tabstop=2
set expandtab
set smartindent

" Disable backup and swap files because they cause more problems than they solve
set nobackup
set noswapfile

" Display line numbers
set number

" Use login shell when running commands within vim
set shell=bash\ --login

" Toggle back and forth between current and previous buffer
map <Leader>b :buffer#<cr>

" Highlight search results
set hlsearch
" Clear search highlighting without disabling it
map <Leader>x :noh<CR>

" Faster listing of files for the CtrlP plugin (similar to Cmd-T plugin)
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" Press space to repeat last macro
map <Space> @q

" Clean whitespace in a file (coverts tabs to spaces and deletes any trailing whitespace)
map <Leader>cw :%s/[ <tab>]*$//<CR>:retab!<CR>:noh<CR>

" Syntax highlighting for more file types
autocmd BufRead,BufNewFile Dockerfile set filetype=sh
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile Berksfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Some stuff for golang
filetype off
filetype plugin indent off
let go_highlight_trailing_whitespace_error = 0
set runtimepath+=/Users/jordan/projects/opensource/go/misc/vim
filetype plugin indent on
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Enable solarized dark
syntax enable
set background=dark
" let g:solarized_termcolors=256
colorscheme solarized

" PHP settings
autocmd FileType php set tabstop=4|set shiftwidth=4
autocmd FileType php set commentstring=//\ %s

" GitHub flavored markdown via vim-flavored-markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
