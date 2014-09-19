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
1.  Create a common user in both machines involved
2.  Setup ssh keys to your github account for the paired project
3.  `git clone https://github.com/qustodian/pair-dev`
4.  ln -s ~/pair-dev/.zshrc ~/.zshrc
5.  ln -s ~/pair-dev/.vimrc ~/.vimrc
6.  ln -s ~/pair-dev/.tmux.conf ~/.tmux.conf
7.  Install vim plugins
8.  Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh "oh my zsh home page")
9.  Install tmuxinator : gem install tmuxinator
10. `tmuxinator start backend`
