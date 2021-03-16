filetype on

" in normal model keyboard mapping:
noremap <silent> ; l
noremap <silent> l h
noremap <silent> J 5j
noremap <silent> K 5k
noremap <silent> W 5w
noremap <silent> B 5b
noremap <C-j> <Esc>0i
noremap <C-k> <Esc>$a


" in insert model keyboard mapping:
imap <C-j> <Esc>0i
imap <C-k> <Esc>$a

" map <SPACE> <nop>
map s <nop>
map S :w<CR>
map Q :q<CR>

" map <LEADER>p "+p
" map <LEADER>y "+y

" set <LEADER> as <SPACE>
let mapleader=" "

" search words
map <silent> <LEADER><CR> :nohlsearch<CR>

" ==<silent> =
" ==<silent> =Window management
" ==<silent> =
" use <LEADER> + new arrow keys for moving the cursor around windows
map <silent> <LEADER>w <C-w>W
map <silent> <LEADER>j <C-w>j
map <silent> <LEADER>k <C-w>k
map <silent> <LEADER>h <C-w>h
map <silent> <LEADER>; <C-w>l

" use <LEADER><LEADER> as A
" map <LEADER><LEADER> A

set updatetime=100
set encoding=utf-8
" when file has been changed, autoread
set autoread
set number
set cursorline
set relativenumber
set t_Co=256
filetype indent on
set autoindent
set expandtab
set softtabstop=4
set tabstop=4
" 使o换行时,自动缩进4空格,否则为8空格
set shiftwidth=4
set noswapfile
set listchars=tab:>>■,trail:■
set list
set wrap
set showcmd
set wildmenu
" 搜索时忽略大小写
set ignorecase
set hlsearch
exec "nohlsearch"
" 使底部或顶部至少显示5行
set scrolloff=5


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" vim-ariline
Plug 'vim-airline/vim-airline'

" a vim themes
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'connorholyday/vim-snazzy'
"auto-pairs
Plug 'jiangmiao/auto-pairs'

" nerdtree
Plug 'preservim/nerdtree'
nnoremap <C-n> :NERDTree<CR>

" Start NERDTree. If a file is specified, move the cursor to its window."
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" like a git status
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeGitStatusIndicatorMapCustom = {
                    \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \}

" ale
Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate.
 " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
 " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <LEADER>f to show documentation in preview window.
nnoremap <silent> <LEADER>f :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" select a word and mark other same words
Plug 'RRethy/vim-illuminate'

" code comment
Plug 'preservim/nerdcommenter'
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" 右侧整体预览
Plug 'wfxr/code-minimap'
Plug 'wfxr/minimap.vim'
let g:minimap_auto_start = 0

" let g:minimap_width = 10

call plug#end()

"===
"===Appearence
"===
colorscheme gruvbox
" colorscheme onedark
" gruvbox 主题会在light和dark随意切换,就设置了全部是dark:
set background=dark
" 下面两条指令使背景透明
let g:gruvbox_transparent_bg = 1
autocmd VimEnter * hi Normal ctermbg=none


"===
"===auto fcitx5
"===
let g:input_toggle = 1
function! Fcitx52en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx52zh()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx52en()
"进入插入模式
autocmd InsertEnter * call Fcitx52zh()
