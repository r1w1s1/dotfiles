# $HOME is live state. Repo is memory.

FILES = \
	.Xresources \
	.bash_profile \
	.bashrc \
	.muttrc \
        .cwmrc \
	.tmux.conf \
	.screenrc \
	.xinitrc.dwm \
	.xinitrc.cwm \
	.xinitrc.common \
	.xprofile \
	.bin/root-daynight.sh \
	.bin/menu

DIRS = \
	.config/sxhkd

OVERLAY = $(HOME)/projects/personal/slackbuilds-overlay

sync:
	@echo "==> Syncing dotfiles"
	@for f in $(FILES); do \
		printf "  cp  %s\n" "$$HOME/$$f"; \
		cp -f "$$HOME/$$f" .; \
	done

	@echo "==> Syncing home tree"
	@cd "$$HOME" && cp -rf --parents $(DIRS) "$(CURDIR)"

	@echo "==> Syncing dwm config"
	@mkdir -p dwm
	@cp $(OVERLAY)/desktop/dwm/config.h dwm/

	@echo "==> Syncing st config"
	@mkdir -p st
	@cp $(OVERLAY)/system/st/config.h st/

	@echo "==> Syncing slstatus config"
	@mkdir -p slstatus
	@cp $(OVERLAY)/desktop/slstatus/config.h slstatus/

	@echo "==> Capturing firefox enterprise policies"
	@mkdir -p etc/firefox/policies
	@cp /etc/firefox/policies/policies.json \
	    etc/firefox/policies/policies.json

.PHONY: sync
