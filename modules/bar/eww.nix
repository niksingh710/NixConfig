{ config, pkgs, lib, ... }:
{
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ./eww-config;
  };
}
