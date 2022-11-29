{ config, pkgs, location, fontName, lib, user, ... }:

{
  dconf.enable = true;
  gtk = {
    enable = true;
    font.name = "${fontName}";
    iconTheme = {
      package = pkgs.la-capitaine-icon-theme; 
      name = "la-capitaine-icon-theme";
    };
    cursorTheme.name = "GoogleDot-Black";
    theme.name = "FlatColor";
  };
}
