if [ -z "$GOPATH" ]; then
  echo 'GOPATHを指定してください(例: GOPATH=$HOME)'
  exit 1
fi

path=$GOPATH

if [ ! -e ~/.vim/bundle ]; then
  # 存在しない場合
  mkdir -p ~/.vim/bundle 
fi

ln -ivs $path/src/github.com/shshimamo/dotfiles/.vim/external_vimrc ~/.vim/external_vimrc
ln -ivs $path/src/github.com/shshimamo/dotfiles/.bashrc ~/.bashrc
ln -ivs $path/src/github.com/shshimamo/dotfiles/.gitconfig ~/.gitconfig
ln -ivs $path/src/github.com/shshimamo/dotfiles/.screenrc ~/.screenrc   
ln -ivs $path/src/github.com/shshimamo/dotfiles/.tmux.conf ~/.tmux.conf 
ln -ivs $path/src/github.com/shshimamo/dotfiles/.vimperatorrc ~/.vimperatorrc
ln -ivs $path/src/github.com/shshimamo/dotfiles/.vimrc ~/.vimrc              
ln -ivs $path/src/github.com/shshimamo/dotfiles/.vrapperrc ~/.vrapperrc
ln -ivs $path/src/github.com/shshimamo/dotfiles/.zshrc ~/.zshrc        
ln -ivs $path/src/github.com/shshimamo/dotfiles/.xvimrc ~/.xvimrc       
ln -ivs $path/src/github.com/shshimamo/dotfiles/.ideavimrc ~/.ideavimrc       
ln -ivs $path/src/github.com/shshimamo/dotfiles/.gemrc ~/.gemrc      
ln -ivs $path/src/github.com/shshimamo/dotfiles/.pryrc ~/.pryrc
ln -ivs $path/src/github.com/shshimamo/dotfiles/.ctags ~/.ctags
ln -ivs $path/src/github.com/shshimamo/dotfiles/.gitignore_global ~/.gitignore_global
