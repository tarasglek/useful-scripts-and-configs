#!/bin/sh
set +x +e
sudo ln -sfv `pwd`/*-fzf `pwd`/*sh /usr/local/bin/
curl -L https://github.com/junegunn/fzf-bin/releases/download/0.17.5/fzf-0.17.5-linux_amd64.tgz | sudo tar -C /usr/local/bin -zxv