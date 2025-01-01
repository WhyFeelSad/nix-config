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
    ../../modules/desktop
    ../../modules/security
    ../../modules/services
    ../../modules/hardware
    ../../modules/impermanence
  ];

  networking.hostName = "beelink";
  networking.networkmanager.enable = true;

  services.flatpak.enable = true;

  system.stateVersion = "${myvars.stateVersion}";
}
