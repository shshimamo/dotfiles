########################################
# 少し凝った zshrc START
# License : MIT
# http://mollifier.mit-license.org/

# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
PROMPT="%{${bg[white]} ${fg[black]}%}%~%{${reset_color}%}
%# "


# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
# setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward


# 少し凝った zshrc END
########################################


########################################
# shima
setopt nolistbeep

#=============================
## Color
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# Color END
#=============================

#=============================
# エイリアス
alias rm='rm -i' # 削除前に確認
alias cp='cp -i' # 上書き前に確認
alias mv='mv -i' # 上書き前に確認
alias mkdir='mkdir -p' # ディレクトリがなければ作成
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias ei='exit'
alias fxg='find . -type f | xargs grep '
alias fg='find . -type f | grep '
alias fdxg='find . -type d | xargs grep '
#alias b='bundle exec'
alias b='BUNDLE_GEMFILE=Gemfile.local bundle'
alias gba='/Users/shima/git-branch-activity'
alias stssh='ssh -i ~/.ssh/id_rsa_staca'
alias v='vim'
alias ls='/usr/local/bin/gls --color=auto'
alias ll='ls -lahG'
alias la='ls -a'

### for git
# brewのgitを参照
alias git='/usr/local/bin/git'
alias g='git'
alias gg='git grep'
alias l='git log --stat --submodule -p'
alias lo='git log --oneline'
alias s='git status'
alias di='git diff'
alias br='git branch -vv --sort=committerdate'
alias ref="git for-each-ref --sort=-committerdate refs/heads/ --format='%(authordate:short)(%(color:red)%(authordate:relative)%(color:reset)) [%(color:green)%(authorname)%(color:reset)] --> %(color:yellow)%(refname:short)'"
alias t='tig'
eval "$(hub alias -s)"
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias gb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

alias jirb='java -cp /Users/shima/Downloads/bsh-2.0b4.jar bsh.Console'

#=============================

#=============================
# glsをsolarizedする為の設定
eval $(/usr/local/bin/gdircolors ~/solarized/dircolors-solarized/dircolors.ansi-universal)
#=============================

#=============================
# enhancdを読み込む
source /Users/shima/enhancd/enhancd/enhancd.sh
#=============================

#=============================
# JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
#=============================

#=============================
# nvm Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#=============================

#=============================
# source zsh-syntax-highlighting
# http://blog.glidenote.com/blog/2012/12/15/zsh-syntax-highlighting/
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
#=============================

#=============================
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
#=============================

#=============================
# elasticsearch
export ELASTICPATH=/usr/local/opt/elasticsearch/libexec/bin/
export PATH=$PATH:$ELASTICPATH
export LOGSTASHPATH=/usr/local/Cellar/logstash/5.6.0/bin
export PATH=$PATH:$LOGSTASHPATH
#=============================

#=============================
# qt55
# https://github.com/thoughtbot/capybara-webkit/wiki/Installing-Qt-and-compiling-capybara-webkit#homebrew
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
#=============================

#=============================
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#=============================

#=============================
### 20150815 add vim 
export PATH=/usr/local/bin:$PATH
#=============================

#=============================
# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH=/Users/shima/.rbenv/shims:$PATH
#=============================

#=============================
# ghq
# https://blog.kentarok.org/entry/2014/06/03/135300
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
#=============================
