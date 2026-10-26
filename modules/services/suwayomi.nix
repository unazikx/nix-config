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
        self',
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.suwayomi-server;
      in
      {
        services.suwayomi-server = {
          enable = true;

          package = self'.packages.suwayomi;

          settings.server = {
            ip = "0.0.0.0";
            port = 4567;

            initialOpenInBrowserEnabled = false;
            databaseType = "POSTGRESQL";

            excludeNotStarted = true;
            excludeCompleted = true;
            excludeUnreadChapters = true;

            globalUpdateInterval = 6;
            updateMangas = true;

            extensionRepos =
              [
                "keiyoushi/extensions/repo/index.pb"
              ]
              |> map (index: "https://raw.githubusercontent.com/${index}");

            downloadAsCbz = true;

            downloadsPath = "${cfg.dataDir}/downloads";
          };
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "suwayomi.${host.hostName}.local"
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

    homeManagerNixos =
      {
        config,
        osConfig,
        ...
      }:
      let
        cfg = osConfig.services.suwayomi-server;
      in
      {
        home.file = {
          "${config.xdg.userDirs.documents}/Suwayomi-Downloads".source =
            config.lib.file.mkOutOfStoreSymlink "${cfg.dataDir}/downloads";
        };
      };
  };
}
