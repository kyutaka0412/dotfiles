#/bin/sh

DOTFILES_DIR=".dotfiles"

git submodule update --init --recursive

# zshrc
if [ -e ~/.zshrc ]; then
	rm -f ~/.zshrc
fi
ln -s ~/$DOTFILES_DIR/.zshrc ~/.zshrc

# neovim
if [ ! -e ~/.config ]; then
	mkdir ~/.config
fi

# astronvim
if [ ! -L ~/.config/nvim ]; then
	ln -s ~/$DOTFILES_DIR/astronvim ~/.config/nvim
fi

# ideavimrc
if [ -e ~/..ideavimrc ]; then
	rm -f ~/.ideavimrc
fi
ln -s ~/$DOTFILES_DIR/.ideavimrc ~/.ideavimrc

# tigrc
if [ -e ~/.tigrc ]; then
	rm -f ~/.tigrc
fi
ln -s ~/$DOTFILES_DIR/.tigrc ~/.tigrc

# obsidian.vimrc
