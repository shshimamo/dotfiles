export PATH=/usr/local/bin:$PATH

# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
HISTIGNORE=history:history

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
#PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
#PROMPT="%{${bg[white]} ${fg[black]}%}%~%{${reset_color}%}
#%# "

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

# See http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Configuration-1
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'
# zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    # RPROMPT="${vcs_info_msg_0_}"

    PROMPT="%{${bg[white]} ${fg[black]}%}%~%{${reset_color}%} ${vcs_info_msg_0_}
%# "
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
setopt ignore_eof

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
# shima
setopt nolistbeep

########################################
# Color
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

########################################
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
alias b='bundle'
alias bl='BUNDLE_GEMFILE=Gemfile.local bundle'
alias stssh='ssh -i ~/.ssh/id_rsa_staca'
alias ls='/usr/local/bin/gls --color=auto'
alias ll='ls -lahG'
alias la='ls -a'
alias ee='tree -f'

### for git
alias g='git'
# -B, -C は意味なし
alias gg='git grep -B 0 -C 0 -A 3'
alias ggpull='git pull --rebase origin $(git current-branch)'
alias gl='git log --stat --submodule -p'
alias l='git log --stat --submodule -p --no-merges master..head'
alias glo='git log --reverse --date=iso --pretty=format:"[%ad] %C(blue)%h%Creset %an : %C(cyan)%s%Creset"'
alias s='git status'
alias di='git diff'
alias br='git branch -vv --sort=-committerdate'
alias ref="git for-each-ref --sort=committerdate refs/heads/ --format='%(authordate:short)(%(color:red)%(authordate:relative)%(color:reset)) [%(color:green)%(authorname)%(color:reset)] --> %(color:yellow)%(refname:short)'"
alias show="git show --stat -p"
alias com="git checkout master; git fetch; git merge origin/master"

alias t='tig'
eval "$(hub alias -s)"
alias gh='cd $(ghq root)/$(ghq list | peco)'
alias gb='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias see='hub browse'
alias q='cd $(ghq root)/$(ghq list Qualizm)'

alias jirb='java -cp /Users/shima/Downloads/bsh-2.0b4.jar bsh.Console'

alias ct='ctags -R --exclude=.git --exclude=node_modules --exclude=log --exclude=*.min.js --exclude=*.min.css --exclude=*.md'

alias d='docker'
alias fig='docker-compose'

########################################
# functions

# Rubymineで開くコマンド
# git grep の結果をpecoに渡してrubymineで開く。cutの1はファイル名,2は行数
function ggm(){
  name_number=$(git grep $@ | peco | cut -d ":" -f 1,2)
  if [ -n "$name_number" ]; then
    mine $name_number
  else
    echo 'fileが見つかりません'
  fi
}

function ggv(){
  name_number=$(git grep $@ | peco | cut -d ":" -f 1,2)
  if [ -n "$name_number" ]; then
    name=$(echo $name_number | cut -d ":" -f 1)
    number=$(echo $name_number | cut -d ":" -f 2)
    vim -c $number $name
  else
    echo 'fileが見つかりません'
  fi
}

function eev(){
  name=$(tree -f | grep $@ | peco | awk '{print $NF}')
  if [ -n "$name" ]; then
    vim $name
  else
    echo 'fileが見つかりません'
  fi
}

function eec(){
  name=$(tree -f | grep $@ | peco | awk '{print $NF}')
  if [ -n "$name" ]; then
    cat $name
  else
    echo 'fileが見つかりません'
  fi
}

function sm(){
  file_name=$(git status -s | peco | rev | cut -d " " -f 1 | rev)
  if [ -n "$file_name" ]; then
    mine $file_name
  else
    echo 'fileが見つかりません'
  fi
}

function sv(){
  file_name=$(git status -s | peco | rev | cut -d " " -f 1 | rev)
  if [ -n "$file_name" ]; then
    vim $file_name
  else
    echo 'fileが見つかりません'
  fi
}

function fm(){
  file_name=$(find . -type f | peco)
  if [ -n "$file_name" ]; then
    mine $file_name
  else
    echo 'fileが見つかりません'
  fi
}

function fv(){
  file_name=$(find . -type f | peco)
  if [ -n "$file_name" ]; then
    vim $file_name
  else
    echo 'fileが見つかりません'
  fi
}

# checkout branch
function co(){
  branch_name=$(git branch --sort=-committerdate | peco | cut -d ' ' -f 3)
  if [ -n "$branch_name" ]; then
    git checkout $branch_name
  else
    echo 'branchが見つかりません'
  fi
}

# hash copy
function hcp(){
  commit_hash=$(git log --date=iso --pretty=format:"[%ad] %h %an : %s" | peco | cut -d ' ' -f 4)
  if [ -n "$commit_hash" ]; then
    echo $commit_hash | pbcopy
  else
    echo 'hashが見つかりません'
  fi
}

function sp() {
  now_dir=$(pwd)
  rails_root=$(ghq root)/$(ghq list Qualizm)
  (cd $rails_root; bin/rspec $now_dir/$@)
}

# browse PR
function bpr(){
  prno=$(git showpr $@ | cut -d ' ' -f 5 | cut -d '#' -f 2)
  echo $prno
  hub browse -- issues/$prno
}

function searchpr() {
  open "https://github.com/search?q=is:merged $@"
}

function full() {
  realpath $@ | pbcopy
}

# stash list & diff
function stshow() {
  git stash show -p stash@{$@}
}

function google() {
  open "https://www.google.co.jp/search?q=$@"
}

function github() {
  open "https://github.com/pulls/review-requested"
}

function fixupstautosquash() {
  git fixup $@
  git stash
  git rebase -i --autosquash $@~
}

# alias lo='git log --reverse --no-merges master..head --date=iso --pretty=format:"[%ad] %C(blue)%h%Creset %an : %C(cyan)%s%Creset"'
function lo() {
  if [ "$1" = "" ]; then
    git log --reverse --no-merges master..head --date=iso --pretty=format:"[%ad] %C(blue)%h%Creset %an : %C(cyan)%s%Creset"
  else
    git log --reverse --no-merges $1..head --date=iso --pretty=format:"[%ad] %C(blue)%h%Creset %an : %C(cyan)%s%Creset"
  fi
}

########################################
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

########################################
# ghq
# https://blog.kentarok.org/entry/2014/06/03/135300
export GOPATH=$HOME/devel
export GOBIN=$GOPATH/bin
export GO111MODULE=on
export PATH=$PATH:$GOPATH/bin

########################################
# See https://github.com/BetterErrors/better_errors/wiki/Link-to-your-editor
export EDITOR="rubymine"

eval "$(anyenv init -)"

########################################
# glsをsolarizedする為の設定
# ghq get https://github.com/seebi/dircolors-solarized.git する
if [ -f $GOPATH/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal ]; then
  eval $(/usr/local/bin/gdircolors $GOPATH/src/github.com/seebi/dircolors-solarized/dircolors.ansi-universal)
fi

########################################
# source zsh-syntax-highlighting
# http://blog.glidenote.com/blog/2012/12/15/zsh-syntax-highlighting/
if [ -f $GOPATH/src/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source $GOPATH/src/github.com/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

########################################
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
export BUILDKITE_TOKEN=hoge
