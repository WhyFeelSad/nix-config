{
  config,
  lib,
  pkgs,
  myvars,
  ...
}:

{
  imports = [
    ./hardware.nix

    ../../modules/base
    ../../modules/impermanence
    ../../modules/services/gnupg
  ];

  networking.hostName = "beelink";
  networking.networkmanager.enable = true;

  environment.systemPackages = [
    pkgs.bottles
  ];

  system.stateVersion = "${myvars.stateVersion}";
}
