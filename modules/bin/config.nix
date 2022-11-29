{ config, pkgs, lib, user, location, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/bin";
in {
  home = {
    file = {
      "binaries/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/binaries/";
    };
  };
}
