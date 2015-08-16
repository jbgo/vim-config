set nocompatible

" Disable F1 for help screen - I open this accidentally all the time!
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

highlight Cursor guifg=NONE guibg=Green
highlight lCursor guifg=NONE guibg=Cyan

call pathogen#infect()
syntax enable
filetype plugin indent on

" Default tabs
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" Disable backup and swap files because they cause more problems than they solve
set nobackup
set noswapfile

set number

" toggle back and forth between current and previous buffer
map <Leader>b :buffer#<cr>

set hlsearch
" clear search highlighting without disabling it
map <Leader>x :noh<CR>

" faster listing of files for the CtrlP plugin (similar to Cmd-T plugin)
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']

" Press space to repeat last macro
map <Space> @q

" Clean whitespace in a file (coverts tabs to spaces and deletes any trailing whitespace)
map <Leader>cw :%s/[ <tab>]*$//<CR>:retab!<CR>

" Syntax highlighting for more file types
autocmd BufRead,BufNewFile Dockerfile set filetype=sh
autocmd BufRead,BufNewFile *.jbuilder set filetype=ruby
autocmd BufRead,BufNewFile Gemfile set filetype=ruby
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile Berksfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

filetype off
filetype plugin indent off
let go_highlight_trailing_whitespace_error = 0
set runtimepath+=/Users/jordan/projects/opensource/go/misc/vim
filetype plugin indent on
syntax on
" au BufWritePost *.go !gofmt -w %
autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:mustache_abbreviations = 1

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
