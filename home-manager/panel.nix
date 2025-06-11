{ pkgs, ... }:
let
  hyprpanel = pkgs.stdenv.mkDerivation {
    pname = "hyprpanel";
    version = "unstable";
    
    src = pkgs.fetchFromGitHub {
      owner = "Jas-SinghFSU";
      repo = "HyprPanel";
      rev = "main"; # or specific commit
      sha256 = ""; # you'll need to fill this
    };
    
    buildInputs = with pkgs; [
      nodejs
      bun
    ];
    
    # Add build steps as needed
  };
in
{
  environment.systemPackages = [ hyprpanel ];
}
