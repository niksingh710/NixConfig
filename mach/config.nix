{ config, pkgs, lib, ... }:

let
  currDir = "${config.home.homeDirectory}/.setup/mach/";
in {
  #home = {
    #file = {
    #  ".config/shell/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/shell/";
    #};
  #};
#  programs.firefox.enable = true;
#  programs.adb.enable = true;

  xdg = {
    mime.enable = true;
  };

  xdg.userDirs = {
    createDirectories = true;
    enable = true;
  };

  programs = {
    home-manager.enable = true;
    mangohud = {
      enable = true;
    };
    zathura = {
      enable = true;
    };
  };
 #  systemd.user.targets = {
 #    tray = {
 #      Unit = {
 #        Description = "Home Manager System Tray";
 #        Requires = [ "graphical-session-pre.target" ];
 #      };
 #    };
	# }; 
  services = {
    # udiskie = {
    #   enable = true;
      # notify = true;
      # tray ="never";
      # automount = true;
      # settings = {
      #   program_options = {
      #     password_prompt = "[\"gnome-keyring\" \"get\" \"{id_uuid}\"]";
      #   };
      #   quickmenu_actions = "[ \"mount\" \"unmount\" \"unlock\" \"terminal\" \"detach\" \"delete\" ]";
      # };
    # };
    dunst = {
      enable = true;
    };
  };
}
