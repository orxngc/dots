{
  pkgs,
  config,
  host,
  lib,
  options,
  ...
}: {
  options = {
    modules.core.networking.enable =
      lib.mkEnableOption "enables networking";
  };
  config = lib.mkIf config.modules.core.networking.enable {
    networking = {
      networkmanager.enable = true;
      hostName = "${host}";
      timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
    };
    # dns things
    environment.etc = {
      "resolv.conf".text = "nameserver 1.1.1.1\n";
    };

    environment.systemPackages = with pkgs; [traceroute speedtest-cli networkmanagerapplet];
  };
}