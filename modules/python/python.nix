{ config, pkgs, user, location, mach-nix, system, home-manager, ... }:

let
  ppkgs = mach-nix.lib."${system}".mkPython {
    requirements = ''
      numpy
      requests
      virtualenv
      pandas
      matplotlib
      pip
      haishoku
      tk
    '';
  };
in {
  home.packages = with pkgs; [ ppkgs ];
}
