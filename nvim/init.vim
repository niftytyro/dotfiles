let mapleader = "/"

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set hidden

" some severs have issues with backups
set nobackup
set nowritebackup

set updatetime=300
" set mouse=a

call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dense-analysis/ale'
  Plug 'shaunsingh/nord.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'vim-airline/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'ap/vim-css-color'
  Plug 'tc50cal/vim-terminal'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'madox2/vim-ai'
  Plug 'f-person/git-blame.nvim'
  "Dart/Flutter
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
call plug#end()


" Colorscheme Config
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
colorscheme onedark
let g:airline_theme='onedark'
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1


" NERDTree Config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <c-v> :NERDTreeToggle<CR>
nmap <silent><c-c> :NERDTreeFind<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> <leader>o o<Esc>
nnoremap <silent> <leader>O O<Esc>

" CoC Config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
 
let g:ale_linters = {
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

inoremap <silent><expr> <c-space> coc#refresh()
" Goto Definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
map <leader>rn <Plug>(coc-rename)
nmap <silent><c-s> :CocActionAsync('showSignatureHelp')<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


" Telescope Config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep{ '--hidden', '-g', '!node_modules/**' }<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" Auto-detect astro files
au! BufRead,BufNewFile *.astro set filetype=astro

lua << EOF
require'telescope'.setup({
    defaults = {
        file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor/" },
    }
})
require("flutter-tools").setup({
    lsp = {
      settings = {
        enableSnippets = true,
      }
    }
})
EOF

