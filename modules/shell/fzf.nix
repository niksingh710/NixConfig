{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    defaultOptions = [ "--bind ctrl-space:select" "--height 60%" ];
    fileWidgetOptions = [ "--preview 'pistol {}'" "--height 60%" ];
    changeDirWidgetOptions = [ "--bind ctrl-space:select" "--preview 'pistol {}'" "--height 60%" ];
  };
}
