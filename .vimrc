set nu
set vb t_vb= "ビープ音をなくす
set ignorecase "大文字小文字を区別しない
set smartcase "ignorecaseを有効にしている時、大文字検索は大文字小文字を無視しないようになる
set hidden "保存されていないファイルがあるときでも別のファイルを開くことが出来る
set expandtab "タブをスペースに置き換える
set tabstop=2 "<TAB>を含むファイルを開いた際何文字の空白に変換するか
set shiftwidth=2 "自動インデントの空白数
set softtabstop=0 "キーボードで<TAB>を入力した際設定する空白数
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set history=50
set backspace=indent,eol,start
set hlsearch
" set directory-=.
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

" FileType ruby  [ruby構文チェック,インデント]
autocmd FileType ruby :map <C-m> <ESC>:!ruby -cW %<CR>
autocmd FileType ruby setlocal ts=2 sw=2 sts=0

" 画面分割したときに、サイズを自動調整
nmap <C-w>w <C-w>w:call <SID>good_width()<CR>
function! s:good_width()
  if winwidth(0) < 80
    vertical resize 80
  endif
endfunction
"-------------------------------

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
" タブ切り替え
" nmap <C-n> :tabnext<CR>
" nmap <C-p> :tabprevious<CR>
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

nnoremap Y Du

"### 挿入モード ###
" ESCの代替
inoremap jj <C-[>
inoremap kk <C-[>

"-- Key Map END
"-------------------------------

"背景色をリセット
"autocmd ColorScheme * highlight Normal ctermbg=none
"autocmd ColorScheme * highlight LineNr ctermbg=none

" vimgrep で自動的にquickfix-window が開く
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <C-c><C-n> :cn<CR>
nnoremap <C-c><C-p> :cp<CR>
nnoremap <C-c><C-c> :.cc<CR>

set clipboard+=unnamed
