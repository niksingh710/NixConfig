{ config, lib, pkgs, inputs, user, location, ... }:

{
  imports =
    [(import ./nix.nix)] ++ 
     [(import ./sys.nix)] ++ 
     [(import ./users.nix)] ++ 
      (import ../modules/root-modules);

  boot = {
    loader.systemd-boot.enable=true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
}

