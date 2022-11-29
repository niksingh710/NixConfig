{ config, pkgs, lib, user, location, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/shell";
in {
  home = {
    file = {
      ".config/shell/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/shell/";
    };
    shellAliases = { 
      l="exa -lahF --color=auto --icons --sort=size --group-directories-first";
      ls="exa -hF --color=auto --icons --sort=size --group-directories-first";
      la="exa -ahF --color=auto --icons --sort=size --group-directories-first";
      lss="exa -lhF --color=auto --icons --sort=size --group-directories-first";
      lst="exa -lahFT --color=auto --icons --sort=size --group-directories-first";
      lt="exa -aT --icons --group-directories-first --color=auto --sort=size";
    };
  };
  
  programs={
    git = {
      enable = true;
      userName = "${user}";
      userEmail = "nik.singh710@gmail.com";
    };
    
    bat.enable = true;
    jq = {
      enable = true;
      colors = {
        null    = "1;30";
        false   = "0;31";
        true    = "0;32";
        numbers = "0;36";
        strings = "0;33";
        arrays  = "1;35";
        objects = "1;37";
      };
    };
    exa.enable = true;
    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };
  };
}
