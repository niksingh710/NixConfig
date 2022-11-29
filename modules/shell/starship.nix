{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$username$hostname$directory$character$nix_shell";
      right_format = "$all";
      character = {
        error_symbol = "[✗](bold red)";
        success_symbol = "[](bold white)";
        vicmd_symbol = "[V](bold green)";
      };
      directory = {
        format =  " [$path]($style)[$read_only]($read_only_style)\\]";
        truncation_length = 1;
      };
      hostname = {
        disabled = false;
        format = "[@](bold red)[$hostname](bold white)";
        ssh_only = false;
      };
      username = {
        disabled = false;
        format = "\\[[$user]($style)";
        show_always = true;
        style_root = "black bold";
        style_user = "white bold";
      };
      nix_shell = {
        disabled = false; 
        symbol = "❄️  ";
        impure_msg = "[i](bold red)";
        pure_msg = "[p](bold green)";
        format = "$symbol ";
      };
    };
  };
}

