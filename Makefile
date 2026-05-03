# $HOME is live state. Repo is memory.

FILES = \
	.Xresources \
	.bash_profile \
	.bashrc \
	.muttrc \
	.tmux.conf \
        .screenrc \
	.vimrc \
	.xinitrc.dwm \
	.xinitrc.common \
	.xprofile \
	.bin/root-daynight.sh \
	.bin/tmux-status.sh \
        .bin/menu

DIRS = \
	.config/sxhkd

HOMEDIR = $(CURDIR)/home/$(shell whoami)

sync:
	@echo "==> Syncing dotfiles"
	@for f in $(FILES); do \
		printf "  cp  %s\n" "$$HOME/$$f"; \
		cp -f "$$HOME/$$f" .; \
	done
	@echo "==> Syncing home tree"
	@cd "$$HOME" && \
	for d in $(DIRS); do \
		printf "  cp -r  %s\n" "$$d"; \
	done
	@cd "$$HOME" && cp -rf --parents $(DIRS) "$(CURDIR)"

	@echo "==> Syncing dwm config"
	@mkdir -p dwm
	@cp $$HOME/projects/personal/slackbuilds-overlay/desktop/dwm/config.h dwm/

	@echo "==> Syncing st config"
	@mkdir -p st
	@cp $$HOME/projects/personal/slackbuilds-overlay/system/st/config.h st/

	@echo "==> Syncing slstatus config"
	@mkdir -p slstatus 
	@cp $$HOME/projects/personal/slackbuilds-overlay/desktop/slstatus/config.h slstatus/
	
	@echo "==> Captured firefox enterprise policies"
	@mkdir -p etc/firefox/policies
	@cp /etc/firefox/policies/policies.json \
	    etc/firefox/policies/policies.json

.PHONY: sync

