#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/lethanix/home.nix
popd
