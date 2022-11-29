{ config, pkgs, lib, user, location, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/node";
in {
  home = {
    file = {
      ".pnpm/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/pnpm/";
    };
  };
}
