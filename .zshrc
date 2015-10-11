setopt nolistbeep

#######################################
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
#######################################

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/shima/.gvm/bin/gvm-init.sh" ]] && source "/Users/shima/.gvm/bin/gvm-init.sh"


# 20150809 rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH=/Users/shima/.rbenv/shims/:$PATH

# 20150815 add vim 
export PATH=/usr/local/bin:$PATH

#######################
# bashrcからもってきた START

#PS1='\[\033[36m\][\u@:\[\033[33m\]\w\[\033[36m\]]\[\033[0m\] \$ '
alias ls='/usr/local/bin/gls --color=auto'
alias ll='ls -lahG'

# add JBOSS_HOME
export JBOSS_HOME=/Users/shima/wildfly/wildfly

# add PATH for DERBY
#export DERBY_HOME=/Applications/NetBeans/glassfish-4.0/javadb/
export DERBY_HOME=/Users/shima/glassfish_zip/glassfish3/javadb/
export PATH=$DERBY_HOME/bin/:$PATH

# add PATH for RVM
export PATH=/Users/shima/.rvm/bin/:$PATH

# add PATH for mysql
# export PATH=/Users/shima/mysql/bin:$PATH

# add PATH for gradle
#export GRADLE_HOME=/Users/shima/gradle/gradle-1.12  zipから展開したやつ
export GRADLE_HOME=/Users/shima/.gvm/gradle/current
export PATH=$GRADLE_HOME/bin:$PATH
# add PATH for maven
export M2_HOME=/Users/shima/maven/apache-maven-3.1.1
export PATH=$M2_HOME/bin:$PATH
# add PATH for java
#export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_25.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$CLASSPATH:./

# add PATH for activator
export PATH=/Users/shima/typesafe/activator-1.2.10-minimal:$PATH

# for git

# brewのgitを参照
alias git='/usr/local/bin/git'

function parse_git_branch {
     git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
     #PROMPT="\h@\u:\W\$(parse_git_branch) \$ "
}
function proml {
     #PS1="\h@\u:\W\$(parse_git_branch) \$ "
     #PS1='\[\033[36m\][\u@:\[\033[33m\]\W\[\033[36m\]]\[\033[0m\]$(parse_git_branch) \$ '
}
proml

alias g='git'

alias jirb='java -cp /Users/shima/Downloads/bsh-2.0b4.jar bsh.Console'

# for GNU command
# http://d.hatena.ne.jp/katz_24/20120126/1327586474
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/shima/.gvm/bin/gvm-init.sh" ]] && source "/Users/shima/.gvm/bin/gvm-init.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# bashrcからもってきた END
########################################



########################################
# 少し凝った zshrc START
# License : MIT
# http://mollifier.mit-license.org/

# 環境変数
export LANG=ja_JP.UTF-8


# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
# 1行表示
# PROMPT="%~ %# "
# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
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
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -lh'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
#case ${OSTYPE} in
#    darwin*)
#        #Mac用の設定
#        export CLICOLOR=1
#        alias ls='ls -G -F'
#        ;;
#    linux*)
#        #Linux用の設定
#        alias ls='ls -F --color=auto'
#        ;;
#esac

# 少し凝った zshrc END
########################################


########################################
# shima

#________________
# エイリアス
alias ei='exit'
#________________


# glsをsolarizedする為の設定
eval $(/usr/local/bin/gdircolors ~/solarized/dircolors.ansi-universal)
# enhancdを読み込む
source /Users/shima/enhancd/enhancd/enhancd.sh
