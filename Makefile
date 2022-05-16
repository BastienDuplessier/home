.DEFAULT_GOAL := help
.PHONY: fish alacritty emacs i3 firefox all help

## Colors
COLOR_RESET = \033[0m
COLOR_INFO = \033[32m
COLOR_COMMENT = \033[33m

all: fish alacritty emacs i3 firefox

# fish & starship (prompt) install & config
fish:
	@echo 'Installing or updating fish & starship'
	@yay -S --noconfirm fish starship
	@echo 'Copying fish/config.fish to ~/.config/fish'
	@mkdir -p ~/.config/fish
	@cp fish/config.fish ~/.config/fish

## alacritty install & config
alacritty:
	@echo 'Installing or updating alacritty'
	@yay -S --noconfirm alacritty
	@echo 'Copying alacritty/alacritty.yml to ~/.config/alacritty'
	@mkdir -p ~/.config/alacritty
	@cp -f alacritty/alacritty.yml ~/.config/alacritty

## emacs install
emacs:
	@echo 'Installing or updating emacs'
	@yay -S --noconfirm emacs
	@echo 'Copying emacs/.emacs into ~/.emacs'
	@cp emacs/.emacs ~/.emacs
	@echo 'Copying emacs/configuration to ~/.emacs.id'
	@mkdir -p ~/.emacs.d
	@cp -r emacs/configuration  ~/.emacs.d

## i3 config
i3:
	@echo 'Copying i3/config to ~/.i3'
	@mkdir -p ~/.i3
	@cp -f i3/config ~/.i3

## Firefox
firefox:
	@echo 'Install Firefox'
	@yay -S --noconfirm firefox

## List available commands
help:
	@printf "\n${COLOR_COMMENT}Usage:${COLOR_RESET}\n"
	@printf " make [target] [arg=\"val\"...]\n\n"
	@printf "${COLOR_COMMENT}Targets:${COLOR_RESET}\n"
	@awk '/^[a-zA-Z\-0-9]+:/ { \
		helpLine = match(lastLine, /^## (.*)/); \
		helpCommand = substr($$1, 0, index($$1, ":")); \
		helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
		printf " ${COLOR_INFO}%-20s${COLOR_RESET} %s\n", helpCommand, helpMessage; \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
