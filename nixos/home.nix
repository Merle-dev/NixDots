{ config, pkgs, ...}: {
    imports = [
        .config/home-manager/modules/bundle.nix
    ];
    home = {
        username = "merle";
        homeDirectory = "/home/merle/";
        stateVersion = "25.05";
        packages = with pkgs; [

            hyprpaper
            hypridle
            hyprshot
            swaynotificationcenter
            clipse
            nwg-look
            udisks
            udiskie
            firefox
            pipewire
            ashell
            bat
            btop
            vesktop
            fishPlugins.tide

            xfce.thunar
            xfce.thunar-volman
            xfce.thunar-archive-plugin

            rustup

            pwvucontrol
            coppwr

            hyfetch
            fastfetch
        ];
    };
    programs.fish = {
        enable = true;
        shellAliases = {
            cat = "bat";
        };
    };
}
