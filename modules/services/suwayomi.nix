{
  zen,
  ...
}:

{
  zen.services.suwayomi = {
    description = ''
      server for manga/manhwa reading
      with builtin webui
    '';

    includes = [
      zen.services.syncyomi
    ];

    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.suwayomi-server;
      in
      {
        services.suwayomi-server = {
          enable = true;

          settings.server = {
            ip = "0.0.0.0";
            port = 4567;

            initialOpenInBrowserEnabled = false;
            databaseType = "POSTGRESQL";

            globalUpdateInterval = 6;
            updateMangas = true;

            extensionRepos = (
              map (p: ("https://raw.githubusercontent.com/" + p)) [
                "yuzono/manga-repo/repo/index.min.json"
                "keiyoushi/extensions/repo/index.pb"
              ]
            );

            downloadAsCbz = true;
            downloadConversions =
              [
                {
                  from = "image/webp";
                  to = "image/jpeg";
                }
                {
                  from = "image/png";
                  to = "image/jpeg";
                }
              ]
              |> map (list: {
                name = list.from;
                value = {
                  target = list.to;
                  compressionLevel = 0.8;
                };
              })
              |> lib.listToAttrs;

            downloadsPath = "${cfg.dataDir}/downloads";

            syncYomiEnabled = config.services.syncyomi.enable;
            syncYomiHost = config.services.syncyomi.config.host;
            syncYomiApiKey = "...";
            syncInterval = "10s";
          };
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "suwayomi.${lib.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.settings.server.ip}:${toString cfg.settings.server.port}
              '';
            });
      };

    user =
      {
        ...
      }:
      {
        extraGroups = [
          "suwayomi"
        ];
      };
  };
}
