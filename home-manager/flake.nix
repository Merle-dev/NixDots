{
    description = "Home Manager configuration of merle";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, hyprpanel, ... } @inputs :
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        homeConfigurations."merle" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ 
	    	    ./home.nix
	    	    {
	    	        home.packages = [
                        hyprpanel.packages.x86_64-linux.default
                    ];
                }
	        ];
        };
    };
}
