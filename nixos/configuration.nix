{config, pkgs, ... }:

let
    home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
    imports = [
        ./hardware-configuration.nix
        ./packages.nix
        ./modules/pipewire.nix
	    (import "${home-manager}/nixos")
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;


    networking.hostName = "nixos";

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Berlin";

    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
    };

    services.displayManager.ly.enable = true;
    services.xserver.xkb = {
        layout = "de";
        variant = "";
    };

    security.polkit.enable = true;
    services.udisks2.enable = true;

    console.keyMap = "de";

    users.users.merle = {
        isNormalUser = true;
        description = "Merle";
        shell = pkgs.fish;
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

    nixpkgs.config.allowUnfree = true;

    hardware.graphics.enable = true;

    programs.hyprland.enable = true;
    programs.steam = {
        enable = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
    programs.fish = {
	    enable = true;
	    shellInit = "hyfetch";
    };

    services.openssh = {
        enable = true;
        ports = [ 22 ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05"; # Did you read the comment?
}
