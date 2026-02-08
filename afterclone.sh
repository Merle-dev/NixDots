#!/bin/bash

mv ~/.config ~/.config_old
mv ../Nixdots ~/.config
cp /etc/nixos/hardware-configuration.nix ~/.config/nix/nixos/
