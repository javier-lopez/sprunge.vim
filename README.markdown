Sprunge.vim is Vim plugin to post to [Sprunge!](http://sprunge.us/)

Preview
-------

Screenshot:

<img src="http://javier.io/assets/img/vim-sprunge-1.jpg"  alt="sprunge" />
<img src="http://javier.io/assets/img/vim-sprunge-2.jpg"  alt="sprunge" />
<img src="http://javier.io/assets/img/vim-sprunge-3.jpg"  alt="sprunge" />

Requirements
------------

* Vim 7.0+
* curl 7.0+

Installation
------------

Pathogen:

git clone https://github.com/chilicuil/vim-sprunge.git ~/.vim/bundle/sprunge

Vundle, add the following to your $HOME/.vimrc file:

    Bundle 'chilicuil/vim-sprunge'

And run inside of vim:

    :BundleInstall

Vim.org:

    Instructions here

Usage
-----

Add a mapping to your ~/.vimrc (change the key to suit your taste):

nnoremap <F11> :Sprunge<CR>

License
-------

© 2013 WTFPL – Do What the Fuck You Want to Public License. - http://www.wtfpl.net/
