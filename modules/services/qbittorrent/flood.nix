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
            "--qburl"
            "http://${qbCfg.serverConfig.Preferences.WebUI.Address}:${toString qbCfg.webuiPort}"
          ];
        };

        systemd.services.flood = {
          serviceConfig = {
            EnvironmentFile = config.security.nix-secrets.templates."services-qbittorrent-flood".path;
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

        security.nix-secrets.templates = {
          "services-qbittorrent-flood" = {
            content =
              # env
              ''
                FLOOD_OPTION_QBUSER="${config.security.nix-secrets.secrets."services-qbittorrent-username"}"
                FLOOD_OPTION_QBPASS="${config.security.nix-secrets.secrets."services-qbittorrent-password"}"
              '';

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
