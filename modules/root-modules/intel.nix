{ config, lib, pkgs, inputs, user, location, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      intel-media-driver            # iGPU
    ];
  };
}

