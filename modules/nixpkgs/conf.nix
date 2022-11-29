{ config, pkgs, lib, location, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/nixpkgs";
in {
  home = {
    file = {
      ".config/nixpkgs/config.nix".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/config.nix";
    };
  };
}
