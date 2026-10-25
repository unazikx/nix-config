{
  zen.custom.syncyomi = {
    nixos =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.syncyomi;
      in
      {
        options = {
          services.syncyomi = {
            enable = lib.mkEnableOption "Syncyomi, sync server for Mihon forks";

            package = lib.mkPackageOption pkgs "syncyomi" {
              nullable = true;
            };

            openFirewall = lib.mkEnableOption "Open the firewall";
          };
        };

        config = lib.mkIf cfg.enable {
          systemd.services.syncyomi = {
            after = [ "network.target" ];
            wantedBy = [ "multi-user.target" ];

            serviceConfig = {
              Type = "simple";
              ExecStart = lib.getExe cfg.package;
              StateDirectory = "syncyomi";
              WorkingDirectory = "/var/lib/syncyomi";
            };
          };

          networking.firewall = lib.mkIf cfg.openFirewall {
            allowedTCPPorts = [ 8282 ];
          };
        };
      };
  };
}
