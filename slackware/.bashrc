# add bin patch
export PATH="$PATH:/sbin:/usr/sbin:$HOME/bin"

export TERM=xterm-256color
export LC_ALL=en_US.UTF-8

# Custom prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Add color
eval `dircolors -b`

# User defined aliases
alias vi='vim'

