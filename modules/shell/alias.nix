{ config, pkgs, location, lib, ... }:

let
  currDir = "${config.home.homeDirectory}/${location}/modules/shell";
in {
  home = {
    file = {
      ".config/shell/".source = config.lib.file.mkOutOfStoreSymlink "${currDir}/shell/";
    };
    shellAliases = { 
      l="exa -lahF --color=auto --icons --sort=size --group-directories-first";
      ls="exa -hF --color=auto --icons --sort=size --group-directories-first";
      la="exa -ahF --color=auto --icons --sort=size --group-directories-first";
      lss="exa -lhF --color=auto --icons --sort=size --group-directories-first";
      lst="exa -lahFT --color=auto --icons --sort=size --group-directories-first";
      lt="exa -aT --icons --group-directories-first --color=auto --sort=size";

      cat = "bat";
      pcat = "bat -p";
      dcat = "bat --decoration=always";
      cpu-governer="ccat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor";
      cpu-turbo="[ $(cat /sys/devices/system/cpu/intel_pstate/no_turbo) = 0 ] && echo \"Turbo: On\" || echo \"Turbo: Off\"";
    };
  };
}
