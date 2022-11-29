{ config, pkgs, lib, user, location, hyprland, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/hyprland";
in {
  home = {
    file = {
      ".config/hypr/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/hypr/";
    };
  };
  # services.swayidle = {
  #   enable = true;
  #   events = [
  #     {
  #       event = "before-sleep";
  #       command = "${config.home.homeDirectory}/binaries/utils/lock";
  #     }
  #     {
  #       event = "lock";
  #       command = "${config.home.homeDirectory}/binaries/utils/lock";
  #     }
  #   ];
  #   timeouts = [
  #     {
  #       timeout = 150;
  #       command = "${pkgs.systemd}/bin/loginctl lock-session";
  #     }
  #     {
  #       timeout = 300;
  #       #command = "systemctl suspend";
  #       command = "${pkgs.systemd}/bin/systemctl suspend";
  #     }
  #   ];
  # };
  # systemd.user.services.swayidle.Install.WantedBy = lib.mkForce ["hyprland-session.target"];
}
