#!/bin/bash
# sandbox 内で dotfiles のシンボリックリンクを作成する
# create-sbx 後に exec-sbx で入って実行: setup-dotfiles

DOTFILES="/Users/shshimamo/devel/src/github.com/shshimamo/dotfiles"

if [ ! -d "$DOTFILES" ]; then
  echo "dotfiles not found at $DOTFILES"
  echo "Make sure dotfiles is mounted (SBX_DEFAULT_MOUNTS)"
  exit 1
fi

ln -sfv "$DOTFILES/.zshrc" ~/.zshrc
ln -sfv "$DOTFILES/.gitconfig" ~/.gitconfig
ln -sfv "$DOTFILES/.gitignore_global" ~/.gitignore_global
ln -sfv "$DOTFILES/.ripgreprc" ~/.ripgreprc
ln -sfv "$DOTFILES/.tmux.conf" ~/.tmux.conf

mkdir -p ~/.config
ln -sfv "$DOTFILES/starship.toml" ~/.config/starship.toml

# claude/settings.json はコピー（sandbox 固有の hooks を追記するため）
mkdir -p ~/.claude
cp -v "$DOTFILES/claude/settings.json" ~/.claude/settings.json

# claude-plugins, claude-tabs のリンク
ln -sfv /Users/shshimamo/.claude-plugins ~/.claude-plugins
ln -sfv /Users/shshimamo/.claude-tabs ~/.claude-tabs

# hooks 設定:
#   1. ホスト用 claude-tabs hooks を削除
#   2. linux 用 claude-tabs hooks を追加
#   3. prompt-insight hook を追加
if command -v jq >/dev/null; then
  # 1. ホスト用 claude-tabs hooks を削除
  jq '
    .hooks //= {} |
    .hooks |= with_entries(
      .value |= map(select(.hooks | all(.command | contains("claude-tabs") | not)))
    )
  ' ~/.claude/settings.json > ~/.claude/settings.json.tmp && mv ~/.claude/settings.json.tmp ~/.claude/settings.json

  # 2. linux 用 claude-tabs hooks を追加
  CLAUDE_TABS="/Users/shshimamo/devel/src/github.com/shshimamo/claude-tabs"
  HOOKS_JSON="$CLAUDE_TABS/hooks-setup-linux.json"
  if [ -f "$HOOKS_JSON" ]; then
    jq --slurpfile h "$HOOKS_JSON" '
      reduce ($h[0].hooks | to_entries[]) as $e (.;
        .hooks[$e.key] = ((.hooks[$e.key] // []) + $e.value)
      )
    ' ~/.claude/settings.json > ~/.claude/settings.json.tmp && mv ~/.claude/settings.json.tmp ~/.claude/settings.json
  fi

  # 3. prompt-insight hook を追加
  PROMPT_HOOK="bash ~/.claude-plugins/prompt-insight/hook.sh"
  jq --arg cmd "$PROMPT_HOOK" '
    .hooks.UserPromptSubmit //= [] |
    if (.hooks.UserPromptSubmit | any(.hooks[].command == $cmd))
    then .
    else .hooks.UserPromptSubmit += [{"matcher": "", "hooks": [{"type": "command", "command": $cmd}]}]
    end
  ' ~/.claude/settings.json > ~/.claude/settings.json.tmp && mv ~/.claude/settings.json.tmp ~/.claude/settings.json

  echo "hooks configured in settings.json"
fi

echo "dotfiles linked successfully"
