{ config, pkgs, lib, user, location, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/menu";
in {
  home = {
    file = {
      ".config/rofi/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/rofi/";
      "${currDir}/rofi/themes/wpg.rasi".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/../ui/wpg/templates/wpg.rasi";
    };
  };
}
