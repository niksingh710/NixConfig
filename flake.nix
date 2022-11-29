{
  description = "My Build of NixOs";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    mach-nix.url = "mach-nix/3.5.0";
    
    nobbz.url = "github:nobbz/nixos-config";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nobbz, mach-nix, hyprland, ... }:
  let
    user = "niksingh710";
    location = ".setup";
    system = "x86_64-linux";
    fontName = "JetBrainsMono Nerd Font";
  in {
    nixosConfigurations = (
      import ./devices.nix {
        inherit (nixpkgs) lib;
        inherit user system location fontName inputs nixpkgs nobbz home-manager mach-nix hyprland;
      }
    );
  };

}
