"Automate Plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
"Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-go', { 'for': 'go' }
Plug 'fatih/vim-go', { 'for': 'go' }
"Text Manipulation
Plug 'tpope/vim-surround'
"Tools
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': { -> mkdp#util#install() } }
"Git
Plug 'tpope/vim-fugitive'
"Writing
Plug 'lervag/vimtex'
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
Plug 'junegunn/limelight.vim'
"Visuals
Plug 'mhinz/vim-signify'
Plug 'lilydjwg/colorizer'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle'}
"Aesthetics
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"General Settings
set nocompatible "be IMproved, required
set nomodeline "for security
filetype plugin on
syntax on
set sb
set spr
set lazyredraw
set updatetime=500
set number
set relativenumber
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,nbsp:␣
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set foldmethod=indent
set foldlevel=99
set conceallevel=2
set mouse=a
let mapleader = ';'
let g:netrw_dirhistmax = 0

"Window Navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L
nnoremap <C-H> :vertical resize -5<CR>
nnoremap <C-J> :resize +5<CR>
nnoremap <C-K> :resize -5<CR>
nnoremap <C-L> :vertical resize +5<CR>
autocmd VimResized * wincmd =

"Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap td  :tabclose<CR>
nnoremap tn :tabnew<CR>

"NerdTree
nmap <C-\> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Aesthetics
let base16colorspace=256
colorscheme base16-tomorrow-night
let g:airline_theme='base16_tomorrow'
let g:airline_symbols = {}
let g:airline_symbols.linenr = 'Ξ'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#whitespace#symbol= '!'

"Deoplete
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1

"Vimtex
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
call deoplete#custom#var('omni', 'input_patterns', {'tex': g:vimtex#re#deoplete})

"Goyo/Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <leader>g :Goyo<CR>

"Vim-Go
let g:go_fmt_fail_silently = 1

"Markdown
nmap <C-p> <Plug>MarkdownPreviewToggle

"Terminal
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>

"Keybindings
nnoremap <C-Space> :FZF<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-c> :Commands<CR>
nnoremap <space><space> :buffer #<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>z :x<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>q :qa<CR>
noremap <leader>y "+y
nnoremap <leader><leader> ;
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"
