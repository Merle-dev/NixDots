{ pkgs, ... }: {
    nixpkgs.config = {
        allowUnfree = true;
        # permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
    };
    environment.systemPackages = with pkgs; [
        hyfetch
        fastfetch
        gcc
        home-manager
        neovim
        alacritty
        wofi
        git
    ];

    fonts.packages = with pkgs; [
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        nerd-fonts.victor-mono
    ];
}
