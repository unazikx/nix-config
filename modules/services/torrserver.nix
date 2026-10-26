{
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    torrserver = {
      type = "github";
      owner = "yourok";
      repo = "torrserver";
    };
    # keep-sorted end
  };

  zen.services.torrserver = {
    description = ''
      local service for streaming torrents
    '';

    nixos =
      {
        inputs,
        pkgs,
        lib,
        config,
        host,
        ...
      }:
      let
        cfg = config.services.torrserver;
      in
      {
        imports = [
          inputs.torrserver.nixosModules.torrserver
        ];

        services.torrserver = {
          enable = true;

          package = pkgs.torrserver;

          enableDLNA = true;
          maxCacheSize = "5GB";
          torrentsDir = "/media/torrserver";
        };

        systemd.tmpfiles.settings.torrserver = {
          "${cfg.dataDir}/settings.json"."L+" = {
            inherit (cfg)
              user
              group
              ;
            mode = "1400";
            argument = toString (
              (pkgs.formats.json { }).generate "settings.json" {
                BitTorr = {
                  # keep-sorted start block=yes
                  UseDisk = true;
                  CacheSize = 2147483648;
                  ConnectionsLimit = 25;
                  DisableDHT = false;
                  DisablePEX = false;
                  DisableTCP = false;
                  DisableUPNP = false;
                  DisableUTP = false;
                  DisableUpload = false;
                  DownloadRateLimit = 0;
                  EnableBonjour = true;
                  EnableDLNA = false;
                  EnableDebug = false;
                  EnableIPv6 = false;
                  EnableLPD = true;
                  EnableRutorSearch = false;
                  EnableTorznabSearch = false;
                  ForceEncrypt = false;
                  LPDIPv6 = false;
                  MergeAllM3U = false;
                  PeersListenPort = 0;
                  PreloadCache = 50;
                  ReaderReadAHead = 95;
                  RemoveCacheOnDrop = false;
                  ResponsiveMode = true;
                  RetrackersMode = 1;
                  ShowFSActiveTorr = true;
                  SslPort = 0;
                  StoreSettingsInJson = true;
                  StoreViewedInJson = false;
                  TorrentsSavePath = cfg.torrentsDir;
                  UploadRateLimit = 0;
                  # keep-sorted end
                };
              }
            );
          };
        };

        services.caddy.virtualHosts =
          lib.genAttrs
            [
              "torrserver.${host.hostName}.local"
            ]
            (_: {
              extraConfig = ''
                encode zstd gzip
                reverse_proxy http://${cfg.address}:${toString cfg.port}
              '';
            });
      };

    user =
      {
        ...
      }:
      {
        extraGroups = [
          "torrserver"
        ];
      };
  };
}
