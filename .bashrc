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
# -----------------------------------------------------------
if ! shopt -q login_shell; then
    for sh in /etc/profile.d/*.sh; do
        [ -x "$sh" ] && . "$sh"
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
alias vi='eh'
alias e='eh'
alias grep='grep --color=auto'

export SFEED_URL_FILE="$HOME/.sfeed/urls"
[ -f "$SFEED_URL_FILE" ] || touch "$SFEED_URL_FILE"
alias feed='sfeed_curses "$HOME"/.sfeed/feeds/*'

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
alias git-codeberg='git push --mirror codeberg'
alias git-repo='git push --mirror repo'
alias git-github='git push --mirror github'
alias git-slackforge='git push --mirror slackware-forge'
alias fetch='NO_COLOR=1 slackfetch'
alias fetchcow='NO_COLOR=1 slackfetch | cowsay -n'
alias tmuxhelp='cat ~/.tmux-cheatsheet.txt'
alias vmssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# -----------------------------------------------------------
# Prompt
# -----------------------------------------------------------
prompt_command() {
    export PROMPT_STATUS=$?
}
# Safe append: preserves hooks from /etc/profile.d/*.sh (like z's _z --add)
PROMPT_COMMAND="prompt_command${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
PS1='$(prompt.sh) '

# -----------------------------------------------------------
# packages count
# -----------------------------------------------------------
pkgcount() {
    total=$(ls /var/log/packages | wc -l)
    sbo=$(ls /var/log/packages | grep '_SBo$' | wc -l)
    official=$((total - sbo))

    printf 'Packages: %s total\n' "$total"
    printf 'Official: %s\n' "$official"
    printf 'SBo: %s\n' "$sbo"
}
