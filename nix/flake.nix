{
    description = "Merles nix config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        helix = {
            url = "github:merle-dev/helix";
            inputs.nixpkgs.follows = "nixpkgs";      
        };
        cldr = {
            url = "github:merle-dev/cldr";
            inputs.nixpkgs.follows = "nixpkgs";      
        };
    };

    outputs = {
        self,
        helix,
        nixpkgs,
        home-manager,
        cldr,
        ...
    } @ inputs: let
        inherit (self) outputs;
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
    # Available through 'nixos-rebuild --flake .#nixos'
    nixosConfigurations."nixos" = 
        nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs system outputs helix;};
            modules = [
                ./nixos/configuration.nix
                ({ helix, ... }: {
                    environment.systemPackages = [
                        helix.packages.${pkgs.system}.default 
                    ];
                })
            ];
    };

    # Available through 'home-manager --flake .#merle@nixos'
    homeConfigurations = {
        "merle@nixos" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
            extraSpecialArgs = {inherit inputs outputs cldr;};
            modules = [
                ./home-manager/home.nix
                {
                    home.packages = [
                        inputs.hyprpanel.packages.x86_64-linux.default
                        inputs.cldr.packages.x86_64-linux.default
                    ];
                }
            ];
            };
        };
    };
}
