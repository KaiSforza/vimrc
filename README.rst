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

* neocomplete
* nerdtree
* python-mode
* tagbar
* tagline
* vim-airline
* vim-fugitive
* vim-latex
* vundle

Most of them are git repos themselves, except for the tagline plugin.

How to use
==========

Just clone this repo and link the rpositories to the right place::

    git clone GITURL
    ln -sv "${PWD}"/vimrc ~/.vim
    cd vimrc
    git submodule update --init --recursive

And that should be all. Some versions or compilations of vim may require you
to have your vimrc in ``$HOME/.vimrc``, and you can do this to make them
work::

    ln -sv .vim/vimrc ~/.vimrc

Keybinds
========

* ``<F8>``: toggle sidebar with taglist and nerdtree
* ``<F9>``: update taglist
* ``bt``: go to next buffer (similar to ``gt``)
* ``bT``: go to next buffer (similar to ``gT``)

Commands
========

* ``:TT`` : same as <F8>
