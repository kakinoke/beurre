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
	mpv \
	w3m \
)

GUIAPPS=(\
	alfred \
	dropbox \
	google-chrome \
	appcleaner \
	iterm2 \
	adobe-creative-cloud \
	visual-studio-code \
)

for i in "${CUIAPPS[@]}"
do
	if [ ! `brew list | grep "$i"` ]; then
		brew install "$i" || true
	else
		echo "Already installed $i"
	fi
done

for i in "${GUIAPPS[@]}"
do
	if [ ! `brew cask list | grep "$i"` ]; then
		brew cask install "$i" || true
	else
		echo "Already installed $i"
	fi
done
