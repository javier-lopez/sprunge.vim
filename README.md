[Sprunge.vim](https://github.com/chilicuil/vim-sprunge) is a global plugin to post to [Sprunge](http://sprunge.us/)

Preview
-------

<p align="center">
  <img src="http://javier.io/assets/img/vim-sprunge.gif"/><br>
</p>

Requirements
------------

* Vim 7.0+
* curl 7.0+

Installation
------------

- [Vundle](https://github.com/gmarik/vundle) way (recommended), add the following to your $HOME/.vimrc file:

        Bundle 'chilicuil/vim-sprunge'

    And run inside of vim:

        :BundleInstall

- [NeoBundle](https://github.com/Shougo/neobundle.vim) way:

        NeoBundle 'chilicuil/vim-sprunge'

    And run inside of vim:

        :NeoBundleInstall

- [Pathogen](https://github.com/tpope/vim-pathogen) way:

        $ git clone https://github.com/chilicuil/vim-sprunge.git ~/.vim/bundle/vim-sprunge

- **Manual** (simplest if you've never heard of vundle or pathogen), download the zip file generated from github and extract it to $HOME/.vim

        mv vim-sprunge*.zip $HOME/.vim
        cd $HOME/.vim && unzip vim-sprunge*.zip

    Update the help tags from vim:

        :helpt ~/.vim/doc/

Usage
-----

:Sprunge (or <kbd>\<Leader\>s</kbd>) to sprunge code to sprunge.us, you may use
it in visual mode to sprunge only the selection.

See <kbd>:h sprunge.txt</kbd> for more help.

License
-------

© 2015 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/
