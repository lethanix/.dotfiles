#!/bin/sh
pushd /home/lethanix/.dotfiles
home-manager switch -f ./users/lethanix/home.nix
popd
