call plug#begin('~/.config/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'sainnhe/sonokai'
    Plug 'luochen1990/rainbow'
    Plug 'mhinz/vim-startify'

    Plug 'lilydjwg/fcitx.vim'
    Plug 'preservim/nerdtree'

    Plug 'liuchengxu/vista.vim'
    Plug 'honza/vim-snippets'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'justinmk/vim-syntax-extra'
    Plug 'sbdchd/neoformat'
    Plug 'Yggdroot/indentLine'
call plug#end()

set termguicolors
let g:sonokai_style = 'atlantis'
let g:sonokai_enable_italic = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_transparent_background = 1
colorscheme sonokai

" Rainbow
let g:rainbow_active = 1

" Airline
let g:airline_theme = 'sonokai'
let g:airline_powerline_fonts = 1

" autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <F3> :NERDTreeToggle<CR> " 开启/关闭nerdtree快捷键
