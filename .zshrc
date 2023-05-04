export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

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

# インクリメンタルサーチをglobで
bindkey '^R' history-incremental-pattern-search-backward
bindkey -e


######################################## kube-ps1
source $(ghq root)/github.com/jonmosco/kube-ps1/kube-ps1.sh
# PROMPT='$(kube_ps1)'$PROMPT

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

# See http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Configuration-1
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' formats "%F{green}%c%u %b %f"
# zstyle ':vcs_info:*' actionformats '%F{red}[%b|%a]%f'
zstyle ':vcs_info:*' actionformats '%F{red} %b|%a %f'
# zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
# zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    # RPROMPT="${vcs_info_msg_0_}"

    PROMPT="%{${bg[black]} ${fg[white]}%}%~%{${reset_color}%} ${vcs_info_msg_0_} $(kube_ps1) %*
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
alias ls='/usr/local/bin/gls --color=auto'
alias ll='ls -lahG'
alias la='ls -a'

### for git
alias g='git'
# -B, -C は意味なし
alias gg='git grep -B 0 -C 0 -A 3'
alias ggpull='git pull --rebase origin $(git current-branch)'
alias gl='git log --stat --submodule -p'
alias glo='git log --reverse --date=iso --pretty=format:"[%ad] %C(blue)%h%Creset %an : %C(cyan)%s%Creset"'
alias s='git status'
alias di='git diff'
alias br='git branch -vv --sort=-committerdate'
alias ref="git for-each-ref --sort=committerdate refs/heads/ --format='%(authordate:short)(%(color:red)%(authordate:relative)%(color:reset)) [%(color:green)%(authorname)%(color:reset)] --> %(color:yellow)%(refname:short)'"
alias show="git show --stat -p"
alias com="git checkout master; git fetch; git merge origin/master"
alias codev="git checkout develop; git fetch; git merge origin/develop"
#alias lo='git log --reverse master..head --date=iso --pretty=format:"[%ad] %an : %C(cyan)%s%Creset / %C(yellow)%h%Creset"'
alias l='git log --stat --submodule -p --no-merges master..head'
alias lf='git log --stat -p --follow'

alias see='gh browse'

alias ghl='cd $(ghq root)/$(ghq list | peco)'

alias ct='ctags -R --exclude=.git --exclude=node_modules --exclude=log --exclude=*.min.js --exclude=*.min.css --exclude=*.md'

alias d='docker'
alias fig='docker compose'

# tmux new -s {Session Name}
alias tn='tmux new -s'
# tmux a -t {Session Name}
alias ta='tmux a -t'
# tmux rename -t {Old Session Name} {New Session Name}
alias trename='tmux rename -t'
# tmux kill-session -t {Session Name}
alias tkill='tmux kill-session -t'
alias tkillserver='tmux kill-server'

alias sshadd='eval `ssh-agent` && ssh-add -K ~/.ssh/id_rsa'

alias k="kubectl"

########################################
# functions

# checkout branch
function co(){
  branch_name=$(git branch --sort=-committerdate | peco | cut -d ' ' -f 3)
  if [ -n "$branch_name" ]; then
    git checkout $branch_name
  else
    echo 'branchが見つかりません'
  fi
}

# stash list & diff
function stshow() {
  git stash show -p stash@{$@}
}

function fixupstashautosquash() {
  #git fixup $@
  git commit --no-verify --fixup $@
  git stash
  git rebase -i --autosquash $@~
}

# tmux ls
function tls() {
  session=$(tmux ls | peco | cut -d ':' -f 1)
  tmux a -t $session
}


# $1: dir, $2: tabname
function tabnew() {
  cd `pwd`
  tabset $1
  tabset --title $1
  tmux new -s $1
}

function ggx(){
  excepts="--"
  for x in "${@:2}"
  do
    excepts="$excepts ':!$x'"
  done
  eval "git grep $1 $excepts"
}

function ggxl(){
  excepts="--"
  for x in "${@:2}"
  do
    excepts="$excepts ':!$x'"
  done
  eval "git grep -l $1 $excepts"
}

function lo(){
  if [ "$1" = "" ]; then
    git log --reverse develop..head --date=iso --pretty=format:"[%ad] %an : %C(cyan)%s%Creset / %C(yellow)%h%Creset"
  elif [[ "$1" =~ ^[0-9]+$ ]]; then
    git log --reverse head~$1..head --date=iso --pretty=format:"[%ad] %an : %C(cyan)%s%Creset / %C(yellow)%h%Creset"
  else
    git log --reverse $1..head --date=iso --pretty=format:"[%ad] %an : %C(cyan)%s%Creset / %C(yellow)%h%Creset"
  fi
}

function his() {
  command=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  # eval $command
  echo $command | tr -d '\n' | pbcopy
  echo "COPY> ${command}"
}

########################################
# anyenv
eval "$(anyenv init -)"

########################################
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

########################################
# go
export GO_VERSION=1.20.1
export GOROOT=$HOME/.anyenv/envs/goenv/versions/$GO_VERSION
export GOPATH=$HOME/go
export PATH=$HOME/.anyenv/envs/goenv/shims/bin:$PATH
export PATH=$GOROOT/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on

########################################
# gemsrc
export GEMSRC_USE_GHQ=true

########################################
# See https://github.com/BetterErrors/better_errors/wiki/Link-to-your-editor
export EDITOR="rubymine"

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
export PATH="$HOME/.anyenv/bin:$PATH"


########################################
# For WARNING `pyenv init -`
# https://github.com/pyenv/pyenv/issues/1906
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi


########################################
ZSH_DIR="${HOME}/.zsh_local"

# .zsh_localがディレクトリで、読み取り、実行、が可能なとき
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    # zshディレクトリより下にある、.zshファイルの分、繰り返す
    for file in ${ZSH_DIR}/**/*.zsh; do
        # 読み取り可能ならば実行する
        [ -r $file ] && source $file
    done
fi


######################################## kubectl & eksctl completion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
fpath=($fpath ~/.zsh/completion)
