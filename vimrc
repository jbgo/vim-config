set nocompatible

source ~/.vim/plugin/matchit.vim

" Add some plugins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/HTML-AutoCloseTag'
Plug 'pearofducks/ansible-vim'
Plug 'jtratner/vim-flavored-markdown'
Plug 'fatih/vim-go'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'henrik/vim-qargs'
Plug 'kchmck/vim-coffee-script'
Plug 'lambdatoast/elm.vim'
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

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$', '\.git', '\.vagrant$', '\.pyc$', 'venv$']

"Open NERDTree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

" yank text to OS X clipboard
" http://evertpot.com/osx-tmux-vim-copy-paste-clipboard/
set clipboard=unnamed
