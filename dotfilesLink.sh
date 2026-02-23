ghqroot=$HOME/devel

if [ ! -e ~/.aws/cli ]; then
  # 存在しない場合
  mkdir -p ~/.aws/cli
fi

ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.aws/cli/alias ~/.aws/cli/alias
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.gitconfig ~/.gitconfig
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.tmux.conf ~/.tmux.conf
#ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.vimrc ~/.vimrc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.zshrc ~/.zshrc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.xvimrc ~/.xvimrc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.ideavimrc ~/.ideavimrc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.gemrc ~/.gemrc
# ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.pryrc ~/.pryrc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.gitignore_global ~/.gitignore_global
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/starship.toml ~/.config/starship.toml
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/.ripgreprc ~/.ripgreprc
ln -ivs $ghqroot/src/github.com/shshimamo/dotfiles/claude/settings.json ~/.claude/settings.json
