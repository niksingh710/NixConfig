{ self, config, pkgs, user, nobbz, system, location, home-manager, ... }:

{
  home = {
    packages = with pkgs; [
      cowsay
      discord
      pavucontrol
      appimage-run
      wpgtk
      feh
      wbg
      rofi-wayland
      tdesktop
      nodejs
      nodePackages.pnpm
      neovim
      gnumake
      gcc
      jmtpfs
      udiskie
      cliphist
      libnotify
      subversion
      swaylock-effects
      swayidle
      wl-clipboard
      xdg-utils
      nobbz.packages.${system}.advcp
      file
    ];
  };
}
