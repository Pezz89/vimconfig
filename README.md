Installation:
	
	git clone https://github.com/Pezz89/vimconfig.git ~/.vim

Local vimrc (.lvimrc)
    once plugins have been installed, it is possible to set up a vimrc locally for both machine and individual projects
    create a file called .lvimrc in the home directory and it will be sourced any time a file is accessed in a sub folder of that directory
    In addition, .lvimrc files can be placed in project folder to allow for project specific vim configuartions

Create symlinks:
	ln -s ~/.vim/vimrc ~/.vimrc

To fix colour (/lack of) problems add the following lines to ~/.bashrc:
    export TERM="xterm-256color"

Installing a local copy of Vim:
    cd ~/.vim/vim/
    make distclean
    ./configure --with-features=huge --enable-pythoninterp --with-python-config-dir=/path/to/python2.7/config
    make

    The following lines must then be added to the .bashrc or .bash_profile:
    alias vim='~/.vim/vim/src/vim'

    The following lines can also be added to the .cshrc for the same effect when accessing vim via ssh:
    setenv VIM $HOME/.vim/vim/runtime/

Installing Homebrew/Linuxbrew and cmake:
    Install homebrew:
    (May need to run "bash" first if running over ssh)
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    Set the brew path:
    set path = (/net/inavouable/u.anasynth10/perry/.linuxbrew/bin $path)
    
    Install cmake via brew:
    brew install cmake

Installing JavaScript Syntastic support
    Install node.js:
    brew install node
    npm -g install jshint

Setting enviroment variables in .cshrc for VIM:
    setenv VIM "~/.vim/vim/src/vim"
    setenv VIMRUNTIME "~/.vim/vim/runtime"
    setenv EDITOR 'vim'

Installing YouCompleteMe (YCM):
    # Set pyenv python to system version to avoid a broken compilation
    pyenv global system
    # A workaround to the lack of a "python2" executable with pyenv
    cd /usr/bin && sudo ln -s python python2
    # Run the install script from the YCM directory
    ./install.sh --clang-completer --system-libclang

Fixing tmux-navigation (No idea what it does but run it when you've just installed neovim):
    infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
    tic $TERM.ti
