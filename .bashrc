# ~/.bashrc - interactive shell setup
# Loaded for every interactive bash (login AND non-login).
# Contains only things that CAN'T be inherited via environ:
# aliases, shell functions, prompt, completion, shopt.

# -----------------------------------------------------------
# Interactive shell guard
# -----------------------------------------------------------
case "$-" in
  *i*) ;;
  *) return ;;
esac

# -----------------------------------------------------------
# TERM (some terminals don't set it correctly)
# -----------------------------------------------------------
if [ -z "$TERM" ]; then
    case "$(tty)" in
        /dev/tty[0-9]*) export TERM=linux ;;
        *)              export TERM=xterm-256color ;;
    esac
fi
[ -n "$STY" ] && export TERM=screen-256color

# -----------------------------------------------------------
# GPG TTY (must be re-set per shell)
# -----------------------------------------------------------
export GPG_TTY="$(tty)"

# -----------------------------------------------------------
# Source system-wide shell setup for non-login shells
# (login shells get this via /etc/profile)
# -----------------------------------------------------------
if ! shopt -q login_shell; then
    for sh in /etc/profile.d/*.sh; do
        [ -r "$sh" ] && . "$sh"
    done
    unset sh
fi

# -----------------------------------------------------------
# Aliases
# -----------------------------------------------------------
alias ls='ls --color=auto'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -al'
alias dir='ls -l'
alias vi='nvi'
alias e='nvi'
alias v='nvi'
alias grep='grep --color=auto'
alias feed='sfeed_curses "$HOME/.sfeed/feeds/*"'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gp='git push'
alias gf='git fetch'
alias gdn='git --no-pager diff'
alias git-backup='git push --mirror codeberg'
alias fetch='NO_COLOR=1 slackfetch'
alias screenhelp='cat ~/.screen-cheatsheet'

# -----------------------------------------------------------
# Prompt
# -----------------------------------------------------------
prompt_command() {
    export PROMPT_STATUS=$?
}
# Safe append: preserves hooks from /etc/profile.d/*.sh (like z's _z --add)
PROMPT_COMMAND="prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
PS1='$(prompt.sh) '

