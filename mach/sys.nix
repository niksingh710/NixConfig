{ config, pkgs, lib, ... }:

let
  currDir = "${config.home.homeDirectory}/.setup/mach/";
in {
  networking.hostName = "mach";
  
  environment = {
    pathsToLink = [ "/share/zsh" ]; 
    variables = {
      PNPM_HOME = "$HOME/.pnpm";
    };
  };
  
  xdg.portal = {
    enable = true;
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_type = "simple";
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f %o -or";
      };
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock.text = ''
      # Account management.
      account required pam_unix.so

      # Authentication management.
      auth sufficient pam_unix.so   likeauth try_first_pass
      auth required pam_deny.so

      # Password management.
      password sufficient pam_unix.so nullok sha512

      # Session management.
      session required pam_env.so conffile=/etc/pam/environment readenv=0
      session required pam_unix.so
    '';
  };
  
  programs = {
    hyprland.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    adb.enable = true;
    npm = {
      enable = true;
      npmrc = ''
        prefix = "$HOME/.npm"
        color = true
     '';
    };
  };
  services = {
    udisks2.enable = true;
    dbus.enable = true;
    auto-cpufreq.enable = true;
    gvfs.enable = true;
    #gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
  
  virtualisation.libvirtd.enable = true;

  hardware.opengl = {
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
      amdvlk
      driversi686Linux.amdvlk
    ];
    driSupport = true;
    driSupport32Bit = true;
  };
  
}
