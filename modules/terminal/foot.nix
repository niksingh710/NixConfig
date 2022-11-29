{ config, pkgs, fontName, ... }:

{
  programs = {
    foot = {
      enable = true;
      settings = {
        main = {
          term = "xterm-256color";
          font = "${fontName} Mono:size=12";
          dpi-aware = "no";
        };
        url = {
          launch = "xdg-open \${url}";
          osc8-underline = "url-mode";
          protocols = "http, https, ftp, ftps, file, gemini, gopher";
          uri-characters = ''
              abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]
            '';
        };
        cursor = {
          style = "beam";
          blink = "yes";
        };
        colors = {
          alpha = "0.0"; 
        };
        key-bindings = {
          spawn-terminal = "Control+Shift+n";
          show-urls-launch = "Control+Shift+u";
        };
      };
    };
  };
}
