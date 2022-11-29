{ config, lib, pkgs, inputs, user, location, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim 
      wget
      killall
      pciutils
      usbutils
      git
      curl
      dash
      brightnessctl
    ];
    binsh = "${pkgs.dash}/bin/dash";

    variables = {
      LIBSEAT_BACKEND="logind";
      MOZ_ENABLE_WAYLAND="1";
      XDG_SESSION_TYPE="wayland";
      XDG_CURRENT_DESKTOP="gnome";
      QT_QPA_PLATFORM="wayland";
      QT_QPA_PLATFORMTHEME="qt5ct";
      _JAVA_AWT_WM_NONREPARENTING="1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
      SDL_VIDEODRIVER="wayland";
      GTK_USE_PORTAL = "1";
      _JAVA_OPTIONS="-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dawt.useSystemAAFontSettings=on";
      QT_WAYLAND_FORCE_DPI="96";
    };
  };
  programs = {
    hyprland.enable = true;
  };

  fonts = {
    fontconfig = {
      cache32Bit = true;
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
    };
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      
      (nerdfonts.override {
        fonts = [
                  "FiraCode" 
                  "DroidSansMono" 
                  "JetBrainsMono"  
                ]; 
      })
    ];
  };
}

