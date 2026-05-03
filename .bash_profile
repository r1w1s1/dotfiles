# ~/.bash_profile - login shell setup
# Loaded ONCE per login session. Sets environment that should be
# inherited by every child process (X, GUI apps, scripts, everything).

# -----------------------------------------------------------
# Environment variables (inherited by all child processes)
# -----------------------------------------------------------

# Editors
export VISUAL=nvi
export EDITOR=nvi
export GIT_EDITOR=nvi

# Make less interpret ANSI color escape codes.
# Required for tools like 'pass ls' that force colors through pipes.
export LESS='-R'

# Nvi configuration via EXINIT (faster than .nexrc file, no file I/O)
# Docs: https://sites.google.com/a/bostic.com/keithbostic/vi
export EXINIT='set showmode|set showmatch|set flash|set ruler|set report=1|map J 5j|map K 5k'

# showmode   - display current mode (INSERT/COMMAND) in status line
# showmatch  - briefly flash matching bracket/paren when closing one is typed
# flash      - flash screen instead of audible bell
# ruler      - show cursor row,column position in status line
# report=1   - report any line change (default is 5)
# map J 5j   - remap J to move down 5 lines (replaces join command, use :j instead)
# map K 5k   - remap K to move up 5 lines (replaces man lookup)

# Video accel
export LIBVA_DRIVER_NAME=iHD

# PATH — prepend personal bins
# (Slackware system paths come from /etc/profile)
PATH="$HOME/.local/bin:$HOME/.bin:$PATH"
export PATH

# -----------------------------------------------------------
# Source .bashrc for interactive shell setup (aliases, prompt)
# -----------------------------------------------------------
[ -f ~/.bashrc ] && . ~/.bashrc

# -----------------------------------------------------------
# Auto-start session menu on tty1 (only if no X yet)
# -----------------------------------------------------------
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && [ -z "$SESSION_MENU" ]; then
    export SESSION_MENU=1
    exec "$HOME/.bin/session-menu-bsddialog.sh"
fi
