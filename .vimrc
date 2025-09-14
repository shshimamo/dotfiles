" 基本設定
set nu                          " 行番号表示
set relativenumber              " 相対行番号表示（現代的）
set vb t_vb=                    " ビープ音をなくす
set ignorecase                  " 大文字小文字を区別しない
set smartcase                   " 大文字が含まれる場合は区別する
set hidden                      " 未保存バッファがあっても別ファイルを開ける
set expandtab                   " タブをスペースに置き換える
set tabstop=2                   " タブ表示文字数
set shiftwidth=2                " 自動インデント文字数
set softtabstop=2               " タブキー入力時の文字数
set smartindent                 " スマートインデント
set autoindent                  " 自動インデント
set history=1000                " コマンド履歴数を増加
set backspace=indent,eol,start  " バックスペース動作改善
set hlsearch                    " 検索結果ハイライト
set incsearch                   " インクリメンタル検索
set encoding=utf8
set fileencodings=utf8,euc-jp,cp932,sjis
" ステータスライン
" set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
set laststatus=2 "ステータスラインを常に表示
set nowrapscan "検索をファイルの先頭へループしない

"-------------------------------
"-- autocmd

" 挿入モードの時のみ、カーソル行をハイライトする
" autocmd InsertEnter,InsertLeave * set cursorline!
autocmd InsertEnter * set cursorline!
autocmd InsertLeave * set nocursorline


"-------------------------------
"-- Key Map START
"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x
"mmで対応カッコにジャンプ
nnoremap mm %
"### ノーマルモード ###
" 先頭/末尾に移動
nnoremap <C-h> ^
nnoremap <C-l> $
" ハイライト削除
nnoremap ** :noh<CR>
" バッファ切り替え
nnoremap <C-j><C-n> :bn<CR>
nnoremap <C-j><C-p> :bp<CR>
" ウィンドウ移動
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
" ウィンドウ分割
nnoremap <C-j>v :vsplit<CR><C-w><C-w>
nnoremap <C-j>s :split<CR><C-w><C-w>
" Qを無効
nnoremap Q <Nop>
" 最後の編集位置に移動
nnoremap <Space>o `.
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

nnoremap <Down> 5j
nnoremap <Up> 5k
nnoremap <Space>e 5<C-e>
nnoremap <Space>y 5<C-y>


"### 挿入モード ###
" ESCの代替
inoremap jj <C-[>
inoremap kk <C-[>

"-- Key Map END
"-------------------------------


" vimgrep で自動的にquickfix-window が開く
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <C-c><C-n> :cn<CR>
nnoremap <C-c><C-p> :cp<CR>
nnoremap <C-c><C-c> :.cc<CR>

set clipboard+=unnamed

" 現代的な追加設定
set wildmenu                    " コマンド補完を強化
set wildmode=longest:full,full  " 補完モード
set showcmd                     " 入力中のコマンドを表示
set showmatch                   " 対応括弧をハイライト
set matchtime=1                 " ハイライト時間短縮
set scrolloff=5                 " スクロール時の余白
set sidescrolloff=5             " 横スクロール時の余白
set updatetime=300              " 更新時間短縮（LSP等で有効）
set timeoutlen=500              " キーマップ待機時間短縮

" ファイルタイプ別設定を有効化
filetype on
filetype plugin on
filetype indent on

" 構文ハイライト
if !exists("g:syntax_on")
  syntax enable
endif

" カラースキーム改善（ターミナルで256色使用）
if &t_Co >= 256
  set t_Co=256
endif
