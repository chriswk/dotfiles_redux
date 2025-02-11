#!/bin/bash -e
if [[ -e $HOME/.oh-my-zsh ]]; then
  echo "Already have oh-my-zsh"
else
  git clone https://github.com/ohmyzsh/ohmyzsh $HOME/.oh-my-zsh
fi
