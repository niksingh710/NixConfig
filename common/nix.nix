{ config, pkgs, user, ... }:

{
  system.stateVersion = "22.05";
  nix = {
    settings.trusted-users = [ "root" "${user}" ];
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
}

