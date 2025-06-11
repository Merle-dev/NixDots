{ config, pkgs, ... }:

{
    home = {
        username = "merle";
        homeDirectory = "/home/merle";
        stateVersion = "25.05";

        packages = with pkgs; [
            hyprpaper
            hypridle
            hyprshot
            hyprpolkitagent
            # hyprpanel
            xwayland

            swaynotificationcenter
            clipse
            nwg-look
            udisks
            udiskie
            firefox
            pipewire
            bat
            btop
            vesktop
            fishPlugins.tide
            librewolf
            unzip

            signal-desktop
            gparted
            # spotify

            xfce.thunar
            xfce.thunar-volman
            xfce.thunar-archive-plugin

            rustup
            ripgrep

            wl-clipboard-rs
            xclip
            cliphist
            xdg-utils

            sassc
            phinger-cursors

            pwvucontrol
            coppwr

            lua
            pyright
            gopls
            typescript-language-server
            vimPlugins.telescope-nvim
            manim
            # vimPlugins.LazyVim

            cava
        ];


        file = {
        # # Building this configuration will create a copy of 'dotfiles/screenrc' in
        # # the Nix store. Activating the configuration will then make '~/.screenrc' a
        # # symlink to the Nix store copy.
        # ".screenrc".source = dotfiles/screenrc;

        # # You can also set the file content immediately.
        # ".gradle/gradle.properties".text = ''
        #   org.gradle.console=verbose
        #   org.gradle.daemon.idletimeout=3600000
        # '';
        };

        # Home Manager can also manage your environment variables through
        # 'home.sessionVariables'. These will be explicitly sourced when using a
        # shell provided by Home Manager. If you don't want to manage your shell
        # through Home Manager then you have to manually source 'hm-session-vars.sh'
        # located at either
        #
        #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
        #
        # or
        #
        #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
        #
        # or
        #
        #  /etc/profiles/per-user/merle/etc/profile.d/hm-session-vars.sh
        #
        sessionVariables = {
            EDITOR = "nvim";
        };

        pointerCursor = {
            name = "phinger-cursors-light";
            package = pkgs.phinger-cursors;
            size = 24;
            gtk.enable = true;
        };

    };

    programs.home-manager.enable = true;
}
