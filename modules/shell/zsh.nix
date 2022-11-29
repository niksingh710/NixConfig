{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.config/shell/history";
      ignoreDups = true;
      share = true;
      extended = false;
    };

    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    shellAliases = {
      history = "history 0";
    };
    localVariables = {
      ZVM_VI_EDITOR="$EDITOR";
      ZVM_INSERT_MODE_CURSOR="$ZVM_CURSOR_BLINKING_BEAM";
      ZVM_VI_INSERT_ESCAPE_BINDKEY="jk";
    };
    initExtraBeforeCompInit = ''
      [ -f "$HOME/.config/shell/commonrc" ] && . "$HOME/.config/shell/commonrc"
      [ -f "$HOME/.config/shell/zsh/config-beforeinit" ] && . "$HOME/.config/shell/zsh/config-beforeinit"
    '';
    initExtra = ''
      [ -f "$HOME/.config/shell/zsh/config-afterinit" ] && . "$HOME/.config/shell/zsh/config-afterinit"
    '';
  };
}
