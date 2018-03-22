" viとの互換性をoff
set nocompatible

" ファイル形式の検出を無効
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'hauleth/blame.vim'


call vundle#end()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab

" indent guide options
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0

colorscheme default

" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=gray
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgray
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1

"colorscheme options
colorscheme blame

" 対応する括弧やブレースを表示
set showmatch matchtime=1

" ステータス行を常に表示
set laststatus=2

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" コメントの色を水色
hi Comment ctermfg=3

" インデント幅
"set shiftwidth=2

" タブキー押下時に挿入される文字幅を指定
"set softtabstop=2

" 対応する括弧を強調表示
set showmatch

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set smartindent

" タイトルを表示
set title

" 行番号の表示
set number

" シンタックスハイライト
syntax on

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~


