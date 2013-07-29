Sprunge.vim is a global plugin to post to [Sprunge](http://sprunge.us/)

Preview
-------

Screenshots:

<img src="http://javier.io/assets/img/vim-sprunge-1.jpg"/>
<img src="http://javier.io/assets/img/vim-sprunge-2.jpg"/>
<img src="http://javier.io/assets/img/vim-sprunge-3.jpg"/>

Requirements
------------

* Vim 7.0+
* curl 7.0+

Installation
------------

*Pathogen*:

    $ git clone https://github.com/chilicuil/vim-sprunge.git ~/.vim/bundle/sprunge

*Vundle*, add the following to your $HOME/.vimrc file:

    Bundle 'chilicuil/vim-sprunge'

And run inside of vim:

    :BundleInstall

*Manual*, download the zip file from http://www.vim.org/scripts/script.php?script_id=4662 and extract it to $HOME/.vim

    mv vim-sprunge*.zip $HOME/.vim
    cd $HOME/.vim && unzip vim-sprunge*.zip

Update the help tags from vim:

    :helpt ~/.vim/doc/

Usage
-----

Add a mapping to your ~/.vimrc (change the key to suit your needs):

    nnoremap <F11> :Sprunge<CR>

License
-------

© 2013 WTFPL, Do What the Fuck You Want to Public License. - http://www.wtfpl.net/
