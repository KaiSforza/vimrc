Kai's VIM configuration repository
##################################

I have split this away from my main dotfiles repo, as I feel like most
people will want to have this separation and only get the vim stuff. Note
that this is generally tested with the Mercurial version of vim, so if
you're using old versions things may not work. I've added some checks for
versions (near the end of the vimrc).

Note that to use this to its full potential, you will need to run ``git
submodule update --init --recursive`` and then compile the youcompleteme
files by following their instructions.

Included plugins:

* vundle
* YouCompleteMe
* python-mode
* vim-airline
* nerdtree
* vim-virtualenv
* tagline

Most of them are git repos themselves, except for the tagline plugin.

How to use
==========

Just clone this repo and link the rpositories to the right place::

    git clone GITURL
    ln -sv "${PWD}"/vimrc ~/.vim
    ln -sv .vim/vimrc ~/.vimrc
    cd vimrc
    git submodule update --init --recursive

To get the warning about the YouCompleteMe plugin to go away, you have to
compile the plugin, and get everything all set up. There are three flags you
can pass to the ``install.sh`` script there:

* ``--clang-completer``: Installs the clang completion system
* ``--system-libclang``: Use the clang libraries on your system
* ``--omnisharp-completer``: Add on the C# completion (requires Mono)

Keybinds
========

* <F8> : toggle sidebar with taglist and nerdtree
* <F9> : update taglist

Commands
========

* :TT : same as <F8>
