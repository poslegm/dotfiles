list-deps:
	cat "./requirements.txt"

install:
	echo "I hope that all dependencies are installed..."
	ln -sv "/home/poslegm/.dotfiles/zsh/.zshenv" ~
	ln -sv "/home/poslegm/.dotfiles/vim/.vimrc" ~
	ln -sv "/home/poslegm/.dotfiles/git/.gitconfig" ~
	ln -sv "/home/poslegm/.dotfiles/tmux/.tmux.conf" ~
	mkdir ~/.ammonite 2> /dev/null; ln -sv "/home/poslegm/.dotfiles/ammonite/predef.sc" ~/.ammonite
	source "/home/poslegm/.zshenv"
	vim -c PlugInstall
	mkdir -p ~/.config/nvim
	ln -sv "/home/poslegm/.dotfiles/vim/neovim-init.vim" ~/.config/nvim/init.vim
	ln -sv "/home/poslegm/.dotfiles/vim/coc-settings.json" ~/.config/nvim/coc-settings.json
