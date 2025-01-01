{
  lib,
  pkgs,
  myvars,
  ...
}:
{
  services = {
    greetd = {
      enable = true;
      vt = 2;
      settings = rec {
        initial_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --remember --time --cmd ${lib.getExe' pkgs.niri "niri-session"}";
          user = "${myvars.userName}";
        };
        default_session = initial_session;
      };
    };
    gnome = {
      gnome-keyring = {
        enable = true;
      };
    };
  };
}
