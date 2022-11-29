{ config, pkgs, user, location, fontName, nobbz, home-manager, mach-nix, hyprland, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./root-pkgs.nix
    ./sys.nix
  ];

  environment.systemPackages = with pkgs; [ foot firefox ];
}
