{
  services = {
    flatpak = {
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
      packages = [
        "com.usebottles.bottles"
      ];
    };
  };
}
