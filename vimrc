" load base config
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/base'
inoremap jk <esc>

autocmd BufNewFile *.lua,*.sh,*.php 0r !~/.vim/template.sh %:e
autocmd BufRead,BufNewFile *.conf setfiletype conf
autocmd BufRead *.php set includeexpr=substitute(v:fname,'\\\','/','g')
autocmd BufRead *.php set include=^#\s*use
autocmd BufRead *.php set suffixesadd+=.php
autocmd BufWinEnter *.volt,*.tp,*.mako set filetype=html
autocmd BufWinEnter *.sls set filetype=yaml
autocmd GUIEnter * silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
autocmd FileType php setlocal commentstring=//\ %s
"call system('mkdir -p ~/.vimtmp/undodir ~/.vimtmp/backupdir ~/.vimtmp/directory')


"colorscheme torte
"filetype on
"filetype plugin indent on
"filetype plugin on

let g:is_bash=1
let $VIMFILES=$HOME.'/.vim'
let @w = 'x~n'

"inoremap <c-l> <esc>:noh<cr>
"inoremap <esc>[ <esc>[
nmap <leader>3 :NERDTreeFind<cr>
nmap <leader>a :set filetype=awk        <CR>
nmap <leader>c :set filetype=css        <CR>
nmap <leader>d :set filetype=htmldjango <CR>
nmap <leader>e :set filetype=sed        <CR>
nmap <leader>g :set filetype=go         <CR>
nmap <leader>h :set filetype=html       <CR>
nmap <leader>j :set filetype=javascript <CR>
nmap <leader>l :set filetype=lua        <CR>
nmap <leader>m :set filetype=markdown   <CR>
nmap <leader>p :set filetype=php        <CR>
nmap <leader>s :set filetype=sh         <CR>
nmap <leader>t :set filetype=txt        <CR>
nmap <leader>v :set filetype=vim        <CR>
nmap <leader>y :set filetype=python     <CR>
set ambiwidth=double
set autoread
set autowriteall
set backup
set bs+=start
set smartindent cindent autoindent
set shiftwidth=4 tabstop=4 smarttab
set clipboard+=unnamed
set complete-=i
set cursorline
set expandtab
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936 fileencoding=utf-8
set foldmethod=manual
set hidden hlsearch
set ignorecase smartcase
set noautochdir
set noshowmatch
set nowrapscan
set number
set pastetoggle=<F5>
set path+=..
set printoptions=formfeed:y,header:0,paper:A4,duplex:off,syntax:n
set scrolloff=1
set shell=/bin/bash
set nocompatible
set showcmd                                 " Show cmd in vim-cmdline.
set t_Co=256                                " Make vim look better in putty.
set textwidth=0
set undodir=~/.vimtmp/undodir
            \ directory=~/.vimtmp/directory
            \ backupdir=~/.vimtmp/backupdir
            \ viewdir=~/.vimtmp/view
            \ undofile
set vb t_vb=                                " Turn off bi-sound of vim.
set wildignore+=*.git\\*,*.tgz,*.zip,*.url,*.pyc,*.class
syntax on

"
"" statusline
"
function Version ()
    return system("grep -o '^v[0-9]*' ~/.vim/version|tr -d '\n'")
endfunction

set laststatus=2
"set statusline=(Vide.%{Version()})\ \ %<%f
"set statusline+=%w%h%m%r
"set statusline+=\ %{getcwd()}
"set statusline+=\ [%{&ff}:%{&fenc}:%Y]
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%
"
"
" vim-plug
"
call plug#begin('~/.vim/plug')

Plug 'vim-scripts/taglist.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'wgwoods/vim-systemd-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'alvan/vim-php-manual'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'
Plug 'roxma/vim-paste-easy'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf',{ 'do':{->fzf#install()}}

call plug#end()

let g:vim_markdown_folding_disabled = 1
let g:gitgutter_max_signs=10000

"
" syntastic
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_quiet_messages = { "level": "errors" }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"
" go-vim
"
let g:go_version_warning = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

"
" NERDTree
"
" autocmd vimenter * NERDTree
map <F3> :NERDTreeToggle<CR>
autocmd vimenter * if !argc()|NERDTree|endif
let g:NERDTreeDirArrowExpandable  = '➤'
" let g:NERDTreeNodeDelimiter       = "\u00a0"
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeShowHidden          = 0
let g:NERDTreeBookmarksFile       = $HOME.'/.vimtmp/NerdBookmarks.txt'
let g:NERDTreeShowBookmarks       = 1
let g:NERDTreeShowFiles           = 1
let g:NERDTreeShowLineNumbers     = 0
let g:NERDTreeWinSize             = 29
let g:NERDTreeMinimalUI           = 1
let g:NERDTreeDirArrows           = 1
let g:NERDTreeIgnore              = [
            \ '.*\.class',
            \ '.*\.pyc',
            \ '.*\.chm',
            \ '.*\.ttf',
            \ '.*\.lnk',
            \ '.*\.cproj',
            \ '.*\.exe',
            \ '.*\.dll',
            \ '.*\.out',
            \ '.*\.files',
            \ '.*\.zip',
            \ '.*\.rar',
            \ '.*\.gif'
            \ ]
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

"
" ctrlp
"
" Making CtrlP.vim load 100x faster — A Tiny Piece of Vim — Medm
" https://medium.com/a-tiny-piece-of-vim/making-ctrlp-vim-load-100x-faster-7a722fae7df6#.emcvo89nx
let g:ctrlp_user_command = [
            \ '.git/',
            \ 'git --git-dir=%s/.git ls-files -oc --exclude-standard'
            \ ]
let g:ctrlp_match_window       = 'bottom,order:btt,min:5,max:5,results:10'
let g:ctrlp_cmd                = 'CtrlPMixed'
let g:ctrlp_mruf_default_order = 1

"
" utime.vim
"
let g:timeStampFormat = '170101'
let g:timeStampString = '%y%m%d'
let g:timeStampLeader = 'version'



nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"定义Operator-Pending映射
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap in' :<c-u>normal! f'vi'<cr>

"一些简单的映射
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
map <leader>a ggVG"
inoremap <C-o> <Esc>o  
inoremap <A-l> <Right>
inoremap <A-h> <Left>
inoremap <A-k> <Up>
inoremap <A-j> <Down>
inoremap <A-b> <PageUp>
inoremap <A-f> <PageDown>
inoremap <C-u> <ESC>ui


