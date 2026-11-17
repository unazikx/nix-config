{
  zen,
  ...
}:

{
  zen.services.qbittorrent.flood = {
    description = ''
      besr frontend for qbittorrent
      very good, fr
    '';

    includes = [
      zen.services.qbittorrent
    ];

    os =
      {
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.flood;
        qbCfg = config.services.qbittorrent;
      in
      {
        services.flood = {
          enable = true;

          host = "localhost";
          port = 8113;

          extraArgs = [
            "--auth"
            "none"
            "--qburl"
            "http://${qbCfg.serverConfig.Preferences.WebUI.Address}:${toString qbCfg.webuiPort}"
            "--qbuser"
            "$PASSWORD"
            "--qbpass"
            "$USERNAME"
          ];
        };

        systemd.services.flood = {
          # INFO:
          # PASSWORD=...
          # USERNAME=...
          serviceConfig = {
            EnvironmentFile = config.security.nix-secrets.secrets."services-qbittorrent-flood".path;
            User = qbCfg.user;
            Group = qbCfg.group;
          };

          path = [ pkgs.mediainfo ];
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "flood.${host.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.host}:${toString cfg.port}
              '';
            });

        security.nix-secrets.secrets = {
          "services-qbittorrent-flood" = {

            # waiting for security.nix-secrets
            #
            # reloadUnits = [
            #   "qbittorrent.service"
            #   "flood.service"
            # ];
          };
        };
      };
  };
}
