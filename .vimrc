"####################################
"## NeoBundle START  
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" ここでunite.vimをbundleしないと補完が効かない
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-scripts/buftabs'


NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'tsukkee/unite-tag'

NeoBundle 'scrooloose/syntastic' "rubocop

" *** TypeScript ***
""http://hachibeechan.hateblo.jp/entry/2015/03/13/Vim%E3%81%A7TypeScript%E3%81%AE%E8%A3%9C%E5%AE%8C%E3%81%AA%E3%81%A9%E3%82%92%E6%9C%89%E5%8A%B9%E3%81%AB%E3%81%97%E3%81%A6%E5%BF%AB%E9%81%A9%E3%81%AB%E3%82%A8%E3%83%87%E3%82%A3%E3%83%83%E3%83%88

NeoBundleLazy 'leafgarland/typescript-vim', {
\ 'autoload' : {
\   'filetypes' : ['typescript'] }
\}
NeoBundleLazy 'jason0x43/vim-js-indent', {
\ 'autoload' : {
\   'filetypes' : ['javascript', 'typescript', 'html'],
\}}
let g:js_indent_typescript = 1
" *** TypeScriptここまで ***

NeoBundle 'fatih/vim-go' 

call neobundle#end()
" NeoBundleCheck を走らせ起動時に未インストールプラグインをインストールする
NeoBundleCheck
" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on
filetype indent on
syntax on
"## NeoBundle END  
"####################################


"####################################
"# Include External File START

"## shima
if filereadable(expand('~/.vim/external_vimrc/shima_vimrc'))
  source ~/.vim/external_vimrc/shima_vimrc
endif

"## Unite 
if filereadable(expand('~/.vim/external_vimrc/unite_vimrc'))
  source ~/.vim/external_vimrc/unite_vimrc
endif

"## rubocop_vimrc
if filereadable(expand('~/.vim/external_vimrc/rubocop_vimrc'))
  source ~/.vim/external_vimrc/rubocop_vimrc
endif

"## neocomplete
if filereadable(expand('~/.vim/external_vimrc/neocomplete_vimrc'))
  source ~/.vim/external_vimrc/neocomplete_vimrc
endif

"## colorscheme
if filereadable(expand('~/.vim/external_vimrc/colorscheme_vimrc'))
  source ~/.vim/external_vimrc/colorscheme_vimrc
endif

"## unite-tag
if filereadable(expand('~/.vim/external_vimrc/unite-tag_vimrc'))
  source ~/.vim/external_vimrc/unite-tag_vimrc
endif

"## nerdtree
if filereadable(expand('~/.vim/external_vimrc/nerdtree_vimrc'))
  source ~/.vim/external_vimrc/nerdtree_vimrc
endif

"## command-git-grep
if filereadable(expand('~/.vim/external_vimrc/command-git-grep'))
  source ~/.vim/external_vimrc/command-git-grep
endif

"## buftabs
if filereadable(expand('~/.vim/external_vimrc/buftabs_vimrc'))
  source ~/.vim/external_vimrc/buftabs_vimrc
endif
" Include External File END
"####################################
