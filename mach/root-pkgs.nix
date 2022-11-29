{ config, pkgs, user, home-manager, system, mach-nix, hyprland, ... }:

{
  environment.systemPackages = with pkgs; [ 
    python3
    rustc
    cargo
    neofetch
    pfetch
    auto-cpufreq
    btop
    grim
    slurp
    polkit_gnome
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    libsecret
    ntfs3g
    rfkill_udev
    
    swayidle
    
    virt-manager
    
    wineWowPackages.stable
    wine
    (wine.override { wineBuild = "wine64"; })
    wineWowPackages.staging
    winetricks
    wineWowPackages.waylandFull
    lutris
  ];
}
