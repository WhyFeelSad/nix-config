{
  config,
  pkgs,
  lib,
  myvars,
  ...
}:
{
  users.mutableUsers = false;

  users.groups = {
    "${myvars.userName}" = { };
    docker = { };
  };

  users.users = {
    "${myvars.userName}" = {
      # generated by `mkpasswd -m scrypt`
      # we have to use initialHashedPassword here when using tmpfs for /
      inherit (myvars) initialHashedPassword;
      openssh.authorizedKeys.keys = myvars.sshAuthorizedKeys;
      home = "/home/${myvars.userName}";
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        myvars.userName
        "users"
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
      ];
    };
    # root's ssh key are mainly used for remote deployment
    root = {
      initialHashedPassword = myvars.initialHashedPassword;
      openssh.authorizedKeys.keys = myvars.sshAuthorizedKeys;
    };
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
