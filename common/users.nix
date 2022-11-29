{ config, lib, pkgs, inputs, user, location, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel" 
      "networkmanager" 
      "audio" 
      "video" 
      "pipewire"
      "libvirtd"
      "input"
      "plugdev"
    ]; 
  };
  security.sudo.wheelNeedsPassword = false;
  users = {
    defaultUserShell = pkgs.zsh;
  };
}

