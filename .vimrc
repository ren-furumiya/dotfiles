" viとの互換性をoff
set nocompatible

" ファイル形式の検出を無効
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-syntastic/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'jacoborus/tender.vim'
Plugin 'itchyny/lightline.vim'

call vundle#end()
filetype plugin indent on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" indent guide options
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup = 1
" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
" 自動カラーを無効にする
"let g:indent_guides_auto_colors=0

"colorscheme options
syntax enable
colorscheme tender
"let 

"lightline
let g:lightline = {
        \ 'colorscheme': 'tender',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
  endfunction

  function! LightlineReadonly()
      return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
    endfunction

    function! LightlineFilename()
        return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
      endfunction

      function! LightlineFugitive()
          if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
                return fugitive#head()
                  else
                        return ''
                          endif
                        endfunction

                        function! LightlineFileformat()
                            return winwidth(0) > 70 ? &fileformat : ''
                          endfunction

                          function! LightlineFiletype()
                              return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
                            endfunction

                            function! LightlineFileencoding()
                                return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
                              endfunction

                              function! LightlineMode()
                                  return winwidth(0) > 60 ? lightline#mode() : ''
                                endfunction


" ステータス行を常に表示
set laststatus=2


"NERDTree option
nnoremap <silent><C-e> :NERDTreeToggle<CR>



"対応する括弧やブレースを表示
set showmatch matchtime=1

" ステータス行を常に表示
set laststatus=2

" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~

" インデント幅
"set shiftwidth=2

" タブキー押下時に挿入される文字幅を指定
"set softtabstop=2

" 対応する括弧を強調表示
set showmatch

" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" タイトルを表示
set title

" 行番号の表示
set number

" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

" 検索語句のハイライト
set hlsearch

"警告音をoff(windows)
set visualbell t_vb=

" setting
" 文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
"
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
