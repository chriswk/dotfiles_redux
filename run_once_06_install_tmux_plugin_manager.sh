#!/bin/bash

if [[ -e $HOME/.tmux/plugins/tpm ]]; then
  echo "Already have TPM installed"
else
  echo "Installing TPM" && \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
