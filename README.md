pair-dev
=======

This repository contains editor configurations that suit our needs to perform remote pair programming

Requirements:
-------------

* [Vim, of course](http://www.vim.org "Vim home page")
* [Tmux](http://tmux.sourceforge.net/ "Tmux home page")
* [wemux](https://github.com/zolrath/wemux "wemux home page")
* [tmuxinator](https://github.com/tmuxinator/tmuxinator "tmuxinator home page")


Usage:
------
1. `clone
2. Create a common user in both machines involved
3. Install vim plugins
4. ln -s ~/pair-dev/.zshrc ~/.zshrc
5. ln -s ~/pair-dev/.vimrc ~/.vimrc
6. ln -s ~/pair-dev/.tmux.conf ~/.tmux.conf
7. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh "oh my zsh home page")
8. `tmuxinator start backend`
