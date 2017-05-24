About
-----

[![Build Status](https://travis-ci.org/javier-lopez/sprunge.vim.png?branch=master)](https://travis-ci.org/javier-lopez/sprunge.vim)

[Sprunge.vim](https://github.com/javier-lopez/sprunge.vim) is a global plugin to post to [Sprunge](http://sprunge.us/)

<p align="center">
  <img src="http://javier.io/assets/img/vim-sprunge.gif"/><br>
</p>

Requirements
------------

* Vim 7.0+
* curl

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your `$HOME/.vimrc` file:

        Bundle 'javier-lopez/sprunge.vim'

    And run inside of vim:

        :BundleInstall

- [NeoBundle](https://github.com/Shougo/neobundle.vim) way:

        NeoBundle 'javier-lopez/sprunge.vim'

    And run inside of vim:

        :NeoBundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/javier-lopez/sprunge.vim.git ~/.vim/bundle/sprunge.vim

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to `$HOME/.vim`

        mv sprunge.vim*.zip $HOME/.vim
        cd $HOME/.vim && unzip sprunge.vim*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

`:Sprunge` (or <kbd>\<Leader\>s</kbd>) to sprunge code to sprunge.us, you may use it in visual mode to sprunge only the selection.

See <kbd>:h sprunge.txt</kbd> for more help.
