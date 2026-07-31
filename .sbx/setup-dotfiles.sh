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

echo "dotfiles linked successfully"
