# $HOME is live state. Repo is memory.

FILES = \
	.Xresources \
	.bash_profile \
	.bashrc \
	.muttrc \
        .cwmrc \
	.tmux.conf \
	.screenrc \
        .xinitrc.bspwm \
	.xinitrc.cwm \
	.xinitrc.common \
	.xprofile \
	.bin/root-daynight.sh \
	.bin/menu \
        .bin/termtmux

DIRS = \
	.config/bspwm \
	.config/sxhkd \
	.config/sxbar

OVERLAY = $(HOME)/projects/collab/slackbuilds
OVERLAY_BRANCH = current-overlay

.PHONY: prepare-overlay sync

prepare-overlay:
	@test -d "$(OVERLAY)/.git" || { \
		echo "Error: overlay not found at $(OVERLAY)"; \
		exit 1; \
	}
	@echo "==> Switching overlay to $(OVERLAY_BRANCH)"
	@git -C "$(OVERLAY)" switch "$(OVERLAY_BRANCH)"

sync: prepare-overlay
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
