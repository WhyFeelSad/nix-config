{
  services.realm = {
    enable = true;
    config = {
      log = {
        level = "info";
      };
      network = {
        no_tcp = false;
        use_udp = true;
        tcp_timeout = 5;
        udp_timeout = 30;
      };
      endpoints = [
        {
          listen = "0.0.0.0:22";
          remote = "192.168.122.102:22";
        }
      ];
    };
  };
}
