list-deps:
	cat "./requirements.txt"

download-deps:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

install:
	echo "I hope that all dependencies are installed..."
	ln -sv "/Users/poslegm/.dotfiles/zsh/.zshenv" ~
	ln -sv "/Users/poslegm/.dotfiles/vim/.vimrc" ~
	ln -sv "/Users/poslegm/.dotfiles/git/.gitconfig" ~
	ln -sv "/Users/poslegm/.dotfiles/tmux/.tmux.conf" ~
	mkdir ~/.ammonite 2> /dev/null; ln -sv "/Users/poslegm/.dotfiles/ammonite/predef.sc" ~/.ammonite
	source "/Users/poslegm/.zshenv"
	vim -c PlugInstall
	mkdir -p ~/.config/nvim
	ln -sv "/Users/poslegm/.dotfiles/vim/neovim-init.vim" ~/.config/nvim/init.vim
	ln -sv "/Users/poslegm/.dotfiles/vim/coc-settings.json" ~/.config/nvim/coc-settings.json
