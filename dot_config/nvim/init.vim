"=============main-shortcuts================="
let mapleader=","
let maplocalleader="\\"


"=============tabs and spaces================="
"show tabs and spaces and stuff"
set list
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
"noexpandtab for unsetting, no* really for any of these options
set showbreak=↪\ 
"set listchars=tab:→\ ,eol:↲,nbsp:␉,trail:␣,extends:⟩,precedes:⟨
set listchars=tab:→\ ,nbsp:␉,trail:␣,extends:⟩,precedes:⟨
"highlight WhiteSpaceBol ctermbg=blue
"highlight WhiteSpaceMol ctermbg=green
"match WhiteSpaceMol / /
"2match WhiteSpaceBol /^ \+/

"termguicolors
set termguicolors

" Current line number and Relative line numbers
set number
set relativenumber


"=============vim plug================="
"VIM PLUG
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'preservim/nerdtree'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'easymotion/vim-easymotion'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Olical/conjure', { 'for': 'clojure' }
" For clojure development, based on https://gitub.com/Olical/blog/blob/master/posts/getting-started-withh
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Completion support, based on //https://practical.li/clojure/clojure-editors/editor-install-guides/neovim-conjure.html
Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }


Plug 'tpope/vim-dispatch'
Plug 'clojure-vim/vim-jack-in'
Plug 'radenling/vim-dispatch-neovim'

Plug 'Shougo/deoplete.nvim'
Plug 'ncm2/float-preview.nvim'

" Linting with clj-kondo
Plug 'dense-analysis/ale'
"Plug 'w0rp/ale'
"
"" Searching in projects - ripgrep
Plug 'liuchengxu/vim-clap'

" navigation
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

"" Version control plugins
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()


"=============nerdtree================="
nnoremap <leader>ntt :NERDTreeToggle<CR>
map <silent> <leader>ntf :NERDTreeFocus<CR>
let NERDTreeShowHidden=1


"=============vim terminal================="
"tnoremap <C-t><Esc> <C-\><C-n>
tnoremap <Esc>t <C-\><C-n>

"load vimrc"
nnoremap <leader>sv :source $MYVIMRC<cr>


"""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""

" Enable startify startup screen
let g:webdevicons_enable_startify = 1

" Search in project configuration
let g:clap_provider_grep_delay = 50
let g:clap_provider_grep_opts = '-H --no-heading --vimgrep --smart-case --hidden -g "!.git/"'

nnoremap <leader>*  :Clap grep ++query=<cword><cr>
nnoremap <leader>fg :Clap grep<cr>
nnoremap <leader>ff :Clap files --hidden<cr>
nnoremap <leader>fb :Clap buffers<cr>
nnoremap <leader>fw :Clap windows<cr>
nnoremap <leader>fr :Clap history<cr>
nnoremap <leader>fh :Clap command_history<cr>
nnoremap <leader>fj :Clap jumps<cr>
nnoremap <leader>fl :Clap blines<cr>
nnoremap <leader>fL :Clap lines<cr>
nnoremap <leader>ft :Clap filetypes<cr>
nnoremap <leader>fm :Clap marks<cr>


" Completion configuration
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview

let g:float_preview#docked = 1
let g:float_preview#max_width = 120
let g:float_preview#max_height = 120 


" Set Gruvbox theme
set background=dark 
autocmd vimenter * colorscheme gruvbox

" Spaceline.vim configuration
"let g:spaceline_colorscheme = 'one'

" Lint configuration - clj-kondo
" clj-kondo should be installed on operating system path
let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}
