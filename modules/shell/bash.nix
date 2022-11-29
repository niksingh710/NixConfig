{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFile = "${config.home.homeDirectory}/.config/shell/history";
    historySize = 10000;
    initExtra = ''
      source "$HOME/.config/shell/commonrc"
    '';
  };
}
