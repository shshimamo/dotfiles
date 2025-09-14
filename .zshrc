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

########################################
# completion
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補をメニューから選択する
zstyle ':completion:*:default' menu select=2

# 補完の詳細な説明を表示
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'

# 補完候補をキャッシュする
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# ディレクトリ補完で末尾にスラッシュを付ける
setopt auto_param_slash

# fzf history search (Ctrl+R)
function fzf-history-widget() {
  local selected num
  selected=( $(fc -rl 1 | awk '!a[$2]++' | fzf --height 50% --query="$LBUFFER" --expect=ctrl-x) )
  local ret=$?
  if [ -n "$selected" ]; then
    if [ "$selected[1]" = ctrl-x ]; then
      # Ctrl+X pressed - execute immediately
      num=${selected[2]%% *}
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
        zle accept-line
      fi
    else
      # Enter pressed - put in command line
      num=${selected[1]%% *}
      if [ -n "$num" ]; then
        zle vi-fetch-history -n $num
      fi
    fi
  fi
  zle reset-prompt
  return $ret
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

bindkey -e

#######################################
# Starship prompt
eval "$(starship init zsh)"

########################################
# ripgrep デフォルト設定
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

########################################
# setopt
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

# コマンドラインでの編集機能強化
setopt correct                   # コマンドのスペルチェック
setopt list_packed               # 補完候補を詰めて表示
setopt noautoremoveslash         # パスの最後のスラッシュを削除しない

# インストール: brew install zsh-syntax-highlighting
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# インストール: brew install zsh-autosuggestions (利用可能な場合のみ有効化)
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

########################################
# Color
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# lsコマンド時、自動で色がつく
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

########################################
# alias
alias rm='rm -i' # 削除前に確認
alias cp='cp -i' # 上書き前に確認
alias mv='mv -i' # 上書き前に確認
alias mkdir='mkdir -p' # ディレクトリがなければ作成
# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
alias ei='exit'

alias b='bundle'
alias ls='ls -G'
alias ll='ls -lahG'
alias la='ls -laG'

alias d='docker'
alias fig='docker compose'

alias k="kubectl"

alias sshadd='eval `ssh-agent` && ssh-add -K ~/.ssh/id_rsa'

### Git alias
alias g='git'
# -A:後, -B:前, -C:前後
alias gg='git grep -B 0 -C 0 -A 3'
# gl: git log (fzf) - 詳細なログ表示
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(green)%an%Creset %s" --date=format:"%m/%d %H:%M" --color=always | fzf --ansi --preview "git show --color=always {1} | delta" --bind "enter:execute(git show {1} --color=always | delta | less -R)"'

alias s='git status'
alias di='git diff'
# alias br='git branch -vv --sort=-committerdate'
alias br='git rev-parse --abbrev-ref HEAD | pbcopy'
alias ref="git for-each-ref --sort=committerdate refs/heads/ --format='%(authordate:short)(%(color:red)%(authordate:relative)%(color:reset)) [%(color:green)%(authorname)%(color:reset)] --> %(color:yellow)%(refname:short)'"
alias show="git show --stat -p"
alias com="git checkout main; git fetch; git merge origin/main"
alias comaster="git checkout master; git fetch; git merge origin/master"
alias codev="git checkout develop; git fetch; git merge origin/develop"
alias l='git log --stat --submodule -p --no-merges master..head'
alias lf='git log --stat -p --follow'
alias see='gh browse'
alias pr='gh pr view --web $(git rev-parse --abbrev-ref HEAD)'
alias che='gh pr checkout'

### tmux alias
# tmux new -s {Session Name}
alias tn='tmux new -s'
# tmux a -t {Session Name}
alias ta='tmux a -t'
# tmux rename -t {Old Session Name} {New Session Name}
alias trename='tmux rename -t'
# tmux kill-session -t {Session Name}
alias tkill='tmux kill-session -t'
alias tkillserver='tmux kill-server'


########################################
# Gitコマンド

# checkout branch
function co(){
  branch_name=$(git branch --sort=-committerdate | fzf \
    --height 50% \
    --preview 'branch=$(echo {} | sed "s/^[* ] //");
               base_branch="";
               for b in main master; do
                 if git show-ref --quiet refs/heads/$b; then
                   base_branch=$b;
                   break;
                 fi;
               done;
               if [ "$branch" != "$base_branch" ] && [ -n "$base_branch" ]; then
                 git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(green)%an%Creset %s" --date=format:"%m/%d %H:%M" --color=always $base_branch..$branch;
               else
                 git log --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(green)%an%Creset %s" --date=format:"%m/%d %H:%M" --color=always -10 $branch;
               fi' \
    --preview-window=right:70% \
    | sed 's/^[* ] //')

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

function lo() {
  local base_branch=""

  if [ "$1" = "" ]; then
    for branch in develop master main; do
      if git show-ref --quiet refs/heads/$branch; then
          base_branch=$branch
          break
      fi
    done
  elif [[ "$1" =~ ^[0-9]+$ ]]; then
    base_branch=head~$1
  elif [ "$1" = "up" ]; then
    base_branch=$(git rev-parse --abbrev-ref HEAD@{upstream} 2>/dev/null)
  else
    base_branch=$1
  fi

  echo "log $base_branch..head"
  git log $base_branch..head --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(green)%an%Creset %s" --date=relative --color=always | \
    fzf --ansi \
        --preview "git show --color=always {1} | delta" \
        --bind "enter:execute(git show {1} --color=always | delta | less -R)" \
        --height 50%
#         --header "Commits from $base_branch to HEAD (Enter: show details)"
}

########################################
# 検索コマンド体系:
#  - repos / ghl - 全リポジトリから検索・移動
#  - proj - 最近使ったプロジェクトから選択
#  - search - コード内容検索
#  - searchf - ファイル名検索
#  - searcht - 言語別検索

# repos: 全リポジトリから検索・移動
function repos() {
  local project_dirs=("$HOME/projects" "$(ghq root)/github.com")
  local selected_dir=""

  for dir in "${project_dirs[@]}"; do
    if [ -d "$dir" ]; then
      selected_dir=$(find "$dir" -maxdepth 4 -type d -name ".git" | sed 's|/.git||' | fzf --height 40% --preview 'cd {} && echo "=== Recent Commits ===" && git log --oneline -5 --color=always 2>/dev/null && echo -e "\n=== Recent Changes ===" && git show --color=always HEAD 2>/dev/null | head -20 || ls -la {} | head -10')
      break
    fi
  done

  if [ -n "$selected_dir" ]; then
    cd "$selected_dir"
    echo "📁 Moved to: $selected_dir"
    # プロジェクト移動時に履歴を記録
    record_dir_change
  fi
}
alias ghl='repos'

# proj: 最近使ったプロジェクトから選択
function proj() {
  local recent_dirs_file="$HOME/.zsh_recent_dirs"

  # 最近のディレクトリファイルが存在しない場合は作成
  if [ ! -f "$recent_dirs_file" ]; then
    touch "$recent_dirs_file"
  fi

  # 最近使ったディレクトリから選択（重複排除して表示）
  if [ -s "$recent_dirs_file" ]; then
    local selected_dir=$(tac "$recent_dirs_file" | awk '!seen[$0]++' | head -20 | fzf --height 40% --header="Recent project directories" --preview 'ls -la {} 2>/dev/null | head -10')
    if [ -n "$selected_dir" ] && [ -d "$selected_dir" ]; then
      cd "$selected_dir"
      echo "💼 Moved to recent directory: $selected_dir"
      return
    fi
  fi

  # ファイルが空の場合はreposを実行
  echo "No recent directories found. Running repos..."
  repos
}

# search - コード内容検索(rg + fzf + bat)
function search() {
  rg "${*:-}" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --nth 3.. \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,40%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(${EDITOR:-vim} {1} +{2})'
}

# searchf: ファイル名検索(fd + fzf + bat)
function searchf() {
  fd --type f --hidden --exclude .git "${*:-}" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --preview 'bat --color=always {} --style=header,grid' \
      --bind 'enter:become(${EDITOR:-vim} {})'
}

# searcht: 言語別検索
function searcht() {
  if [ $# -eq 0 ]; then
    echo "Usage: searcht <file_type>"
    echo "Examples: searcht js    # JavaScriptファイルをライブ検索"
    echo "         searcht py    # Pythonファイルをライブ検索"
    return 1
  fi

  local file_type="$1"

  rg --type "$file_type" "" |
  fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --nth 3.. \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,40%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(${EDITOR:-vim} {1} +{2})'
}

########################################
# 便利コマンド:

function his() {
  command=`history -n 1 | tac  | awk '!a[$0]++' | fzf --height 50%`
  # eval $command
  echo $command | tr -d '\n' | pbcopy
  echo "COPY> ${command}"
}

# tmux ls
function tls() {
  session=$(tmux ls | fzf | cut -d ':' -f 1)
  tmux a -t $session
}

# todos: TODO/FIXME/HACK等のコメント検索
function todos() {
  rg "TODO|FIXME|HACK|XXX|BUG" | \
  fzf --ansi --preview 'bat --color=always $(echo {} | cut -d: -f1) --highlight-line $(echo {} | cut -d: -f2)' \
      --bind 'enter:become(${EDITOR:-vim} $(echo {} | cut -d: -f1) +$(echo {} | cut -d: -f2))'
}

# record_dir_change: ディレクトリ履歴を記録する関数(recentコマンド用)
function record_dir_change() {
  local recent_dirs_file="$HOME/.zsh_recent_dirs"
  local current_dir="$PWD"

  # ディレクトリを追加
  echo "$current_dir" >> "$recent_dirs_file"

  # ファイルサイズを1000行に制限（超えた場合は500行まで削減）
  if (( $(wc -l < "$recent_dirs_file" 2>/dev/null || echo 0) > 1000 )); then
    tail -500 "$recent_dirs_file" > "${recent_dirs_file}.tmp" && mv "${recent_dirs_file}.tmp" "$recent_dirs_file"
  fi
}

# gwt: Git worktree管理
function gwt() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local worktree=$(git worktree list | fzf --header="Select worktree" | awk '{print $1}')
    if [ -n "$worktree" ]; then
      cd "$worktree"
    fi
  else
    echo "Not in a git repository"
  fi
}

# envs: 環境変数のクイック確認
function envs() {
  env | fzf --preview 'echo {} | cut -d= -f2-'
}

# ports: ポート使用状況確認
function ports() {
  lsof -i -P -n | grep LISTEN | fzf --header="Listening ports" --preview 'echo {}'
}

# ディレクトリ履歴をfzfで選択
function cd_history() {
  local dir
  dir=$(dirs -p | fzf --height 40% --preview 'ls -la {}') && cd "$dir"
}
alias cdh='cd_history'

# AWS プロファイル切り替え
function aws_profile() {
  local profile
  profile=$(cat ~/.aws/config | grep '\[profile' | sed 's/\[profile //g' | sed 's/\]//g' | fzf --height 40%)
  if [ -n "$profile" ]; then
    export AWS_PROFILE=$profile
    echo "AWS_PROFILE set to: $profile"
  fi
}
alias ap='aws_profile'

# kubectl context切り替え
function kube_context() {
  local context
  context=$(kubectl config get-contexts -o name | fzf --height 40%)
  if [ -n "$context" ]; then
    kubectl config use-context $context
  fi
}
alias kc='kube_context'

# procs: プロセス検索 (fzf)
alias procs='ps aux | fzf --header-lines=1 --preview "echo {}"'

# docker コンテナ操作 (fzf)
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | fzf --header-lines=1 --preview "docker inspect {1}" | awk "{print \$1}"'
alias dexec='container=$(docker ps --format "{{.Names}}" | fzf) && docker exec -it $container /bin/bash'

########################################
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

########################################
# gemsrc
export GEMSRC_USE_GHQ=true

########################################
# zsh local settings
ZSH_DIR="${HOME}/.zsh_local"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    for file in ${ZSH_DIR}/**/*.zsh; do
        [ -r $file ] && source $file
    done
fi

########################################
# kubectl & eksctl completion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
fpath=($fpath ~/.zsh/completion)
autoload -Uz compinit && compinit -i

########################################
# brew
eval $(/opt/homebrew/bin/brew shellenv)

########################################
# anyenv
eval "$(anyenv init -)"

########################################
# Docker
export PATH="/Users/shshimamo/docker/bin:$PATH"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/shshimamo/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

########################################
# fzf
# fzf デフォルト設定 https://www.mankier.com/1/fzf#Options
export FZF_DEFAULT_OPTS='--layout=reverse --border --bind ctrl-d:half-page-down,ctrl-u:half-page-up,down:preview-down,up:preview-up,shift-down:preview-half-page-down,shift-up:preview-half-page-up'
