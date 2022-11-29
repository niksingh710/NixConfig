{ config, pkgs, lib, ... }:
{
  programs.go = {
    enable = true;
    packages = {
#      "simplehttp" = builtins.fetchGit "https://github.com/niksingh710/simplehttp";
#      "golang.org/x/text" = builtins.fetchGit "https://go.googlesource.com/text";
    };
    goBin = "go/bin";
  };
}
