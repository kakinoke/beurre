#!/bin/bash

CUIAPPS=(\
	tmux \
	vim \
	rbenv \
	ruby-build \
	figlet \
	pyenv \
	reattach-to-user-namespace \
	peco \
	fzf \
	node \
)

GUIAPPS=(\
	alfred \
	clipy \
	google-chrome \
	dash3 \
	appcleaner \
	iterm2 \
	adobe-creative-cloud \
	visual-studio-code \
)

for i in "${CUIAPPS[@]}"
do
	if [ ! `brew list --formula| grep "$i"` ]; then
		brew install "$i" || true
	else
		echo "Already installed $i"
	fi
done

for i in "${GUIAPPS[@]}"
do
	if [ ! `brew list --cask | grep "$i"` ]; then
		brew install --cask "$i" || true
	else
		echo "Already installed $i"
	fi
done
