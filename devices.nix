{ lib, inputs, nixpkgs, home-manager, mach-nix, user, nobbz, location, fontName, system, hyprland, ... }:

let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in {
  mach = lib.nixosSystem {
    specialArgs = { inherit lib pkgs inputs user location nobbz fontName system mach-nix; };
    
    modules = [
      ./common
      ./mach

      hyprland.nixosModules.default
      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit user location nobbz system fontName mach-nix; };
        home-manager.users.${user} = {
          imports = [(import ./common/home.nix)]
                    ++[(import ./mach/home.nix)];
        };
      }
    ]; 
  };
}
