{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
    imports = [ inputs.zen-browser.homeModules.twilight ];

    nixpkgs = {
        overlays = [];
        config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
        };
    };
    
    systemd.user.startServices = "sd-switch";
    
    programs = { 
        zen-browser.enable = true;
        home-manager.enable = true;
    };

    home = {
        username = "merle";
        homeDirectory = "/home/merle";
        stateVersion = "25.05";
    
        pointerCursor = {
            name = "phinger-cursors-dark";
            package = pkgs.phinger-cursors;
            size = 32;
            gtk.enable = true;
        };

        packages = with pkgs; [

            # Window-Manager
            niri
            rofi
            swww # will be changed into awww when it releases
            xclip
            swaybg
            waybar
            xwayland
            swaylock
            cliphist
            nwg-look
            pscircle
            hypridle
            hyprshot
            hyprpaper
            xdg-utils
            waybar-mpris
            wl-clipboard-rs
            hyprpolkitagent
            phinger-cursors
            xwayland-satellite
            swaynotificationcenter

            # Utils
	        kitty
            fuzzel
            wleave

            # Cli
	        jq
            eza
            bat
            cava
            btop
	        nmap
            helix
            unzip
            kalker
	        ffmpeg
            hyfetch
	        pamixer
            ripgrep
	        arp-scan
            fastfetch

            clipse
            udisks
            udiskie
            firefox
            vesktop
            pipewire
            fishPlugins.tide


            # Programming
	        jdk
            bun
            lua
	        ghc
            nasm
            manim
            gopls
            gitui
            sassc
            rustup
            pyright
            surrealdb
            crates-tui
            lua-language-server
            haskell-language-server
            vimPlugins.telescope-nvim
            typescript-language-server
	        jetbrains.idea-community-bin

            # Programs
	        reco
            coppwr
	        parted
            heroic
	        shotcut
            blender
            obsidian
	        gamemode
            surrealist
            pwvucontrol
            prismlauncher
            signal-desktop

            xfce.thunar
            xfce.thunar-volman
            xfce.thunar-archive-plugin
        ];
    };
}
