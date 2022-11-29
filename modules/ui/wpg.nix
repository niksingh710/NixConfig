{ config, pkgs, location, lib, user, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/ui/";
  template = "${currDir}/wpg/templates";
in {
  home = {
    file = {
     ".config/wpg/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/wpg/";
      "Pictures/Wallpapers/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/wall/";
      ".local/share/themes/FlatColor".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/FlatColor/";
      ".icons/GoogleDot-Black".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/GoogleDot-Black/";
      ".themes/FlatColor".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/FlatColor/";
      ".config/btop".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/btop/";

      "${currDir}/btop/themes/FlatColor.theme".source = config.lib.file.mkOutOfStoreSymlink "${template}/btop";
      "${currDir}/FlatColor/gtk-2.0/gtkrc".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/wpg/templates/gtkrc";
      "${currDir}/FlatColor/gtk-3.0/gtk.css".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/wpg/templates/gtk.css";
      "${currDir}/FlatColor/gtk-3.2/gtk.css".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/wpg/templates/gtk.css";
      };
  };
}
