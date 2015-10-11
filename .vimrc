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
NeoBundle 'szw/vim-tags'
NeoBundle 'honza/vim-snippets'
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle "sjl/gundo.vim"
" Solarizedとlightlineが競合
" NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'basyura/unite-rails'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'tacroe/unite-mark'


"## vim使っているrubyistで、これ入れていないのはヤバいプラグインまとめ
if filereadable(expand('~/.vim/external_vimrc/alpaca_neobundle_vimrc'))
  source ~/.vim/external_vimrc/alpaca_neobundle_vimrc
endif

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

"## alpaca 
if filereadable(expand('~/.vim/external_vimrc/alpaca_vimrc'))
  source ~/.vim/external_vimrc/alpaca_vimrc
endif

"## vim-tags
if filereadable(expand('~/.vim/external_vimrc/vim-tags_vimrc'))
  source ~/.vim/external_vimrc/vim-tags_vimrc
endif

"## neocomplete
if filereadable(expand('~/.vim/external_vimrc/neocomplete_vimrc'))
  source ~/.vim/external_vimrc/neocomplete_vimrc
endif

"## tab
if filereadable(expand('~/.vim/external_vimrc/tab_vimrc'))
  source ~/.vim/external_vimrc/tab_vimrc
endif

"## lightline
if filereadable(expand('~/.vim/external_vimrc/lightline_vimrc'))
  source ~/.vim/external_vimrc/lightline_vimrc
endif

"## solarized
if filereadable(expand('~/.vim/external_vimrc/solarized_vimrc'))
  source ~/.vim/external_vimrc/solarized_vimrc
endif

"## gundo
if filereadable(expand('~/.vim/external_vimrc/gundo_vimrc'))
  source ~/.vim/external_vimrc/gundo_vimrc
endif

"## buftabs
if filereadable(expand('~/.vim/external_vimrc/buftabs_vimrc'))
  source ~/.vim/external_vimrc/buftabs_vimrc
endif

" Include External File END
"####################################

