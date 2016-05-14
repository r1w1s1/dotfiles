# My dotfiles
My dotfiles 


I keep my **dotfiles** repo into **/home/ricardson/GitHub/** and use **stow** utility to manage my files.


## How it works?

I just move the files and directories from /home/ricardson/{.vim,.vimrc} into **dotfiles/vim** repo and use **stow** to manage the symlinks**


```
dotfiles
└── vim
     └── .vim
     └── .vimrc
```



```
cd /home/ricardson/GitHub/dotfiles

stow vim -t ../../
```


```
cd /home/ricardson
ls

lrwxrwxrwx.  1 ricardson ricardson   24 May 13 21:19 .vim -> GitHub/dotfiles/vim/.vim
lrwxrwxrwx.  1 ricardson ricardson   26 May 13 21:19 .vimrc -> GitHub/dotfiles/vim/.vimrc
```



* [GNU Stow](http://www.gnu.org/software/stow/) - Symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place.
