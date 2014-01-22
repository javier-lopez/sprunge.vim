[Sprunge.vim](https://github.com/chilicuil/vim-sprunge) is a global plugin to post to [Sprunge](http://sprunge.us/)

Preview
-------

<p align="center">
  <img src="http://javier.io/assets/img/vim-sprunge-1.jpg"/><br>
  <img src="http://javier.io/assets/img/vim-sprunge-2.jpg"/><br>
  <img src="http://javier.io/assets/img/vim-sprunge-3.jpg"/><br>
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

:Sprunge to sprunge code to sprunge.us, you may use it in visual mode to
sprunge only the selection.

You can also use the provided mapping of <kbd>\<Leader\>s</kbd> in both normal
mode (sprunge entire buffer) or visual mode (sprunge only the selection)

License
-------

© 2013 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/chilicuil/vim-sprunge/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
