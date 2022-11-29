{ self, config, pkgs, lib, user, system, nobbz, location, fontName, mach-nix, home-manager, ... }:

{
  imports = 
    [( import ./usr-pkgs.nix)] ++
    [( import ./config.nix)] ++
    ( import ../modules/python) ++
    ( import ../modules/hyprland) ++
    ( import ../modules/terminal) ++
    ( import ../modules/nixpkgs) ++
    ( import ../modules/ui) ++
    ( import ../modules/node) ++
    ( import ../modules/go) ++
    ( import ../modules/bar) ++
    ( import ../modules/bin) ++
    ( import ../modules/menu) ++
    ( import ../modules/shell);
  home = {
    stateVersion = "22.05"; 
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
}
