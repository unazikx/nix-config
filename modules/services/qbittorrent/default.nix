{
  ...
}:

{
  zen.services.qbittorrent = {
    description = ''
      best torrent client

      services.qbittorrent.serverConfig = {
        BitTorrent.Session.DefaultSavePath = lib.mkDefault "...";
      };
      use for override download dir ^^^
    '';

    os =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.qbittorrent;
      in
      {
        services.qbittorrent = {
          enable = true;
          openFirewall = true;

          webuiPort = 8112;
          torrentingPort = 6881;

          profileDir = "/var/lib/qBittorrent";

          serverConfig = {
            LegalNotice.Accepted = true;

            BitTorrent.Session = {
              TempPathEnabled = true;
              DefaultSavePath = "/media/torrents" |> lib.mkDefault;
              QueueingSystemEnabled = true;
              IgnoreSlowTorrentsForQueueing = true;
              SlowTorrentsDownloadRate = 40; # kbps
              SlowTorrentsUploadRate = 40; # kbps
              GlobalMaxInactiveSeedingMinutes = 43800;
              GlobalMaxSeedingMinutes = 10080;
              GlobalMaxRatio = 2;
              MaxActiveCheckingTorrents = 2;
              MaxActiveDownloads = 5;
              MaxActiveUploads = 15;
              MaxActiveTorrents = 20;
              MaxConnections = 600;
              MaxUploads = 200;
            };

            Preferences.WebUI = {
              Enabled = true;
              Address = "0.0.0.0"; # access for localhost without login
              AuthSubnetWhitelistEnabled = true;
              LocalHostAuth = false;
              UseUPnP = true;
              Username = "@USERNAME@";
              Password_PBKDF2 = "@PASSWORD@";
              # ^^^ generate password
              #     https://gist.github.com/hastinbe/8b8d247f17481cfc262a98d661bc0fd5
            };

            RSS.Session = {
              EnableProcessing = true;
              MaxArticlesPerFeed = 2000;
              RefreshInterval = 10;
            };

            Network.Proxy = {
              # INFO:
              # px1.blockme.site:3128
              # px2.blockme.site:3128
              # https://rutracker.org/forum/viewtopic.php?t=5134313
              HostnameLookupEnabled = true;
              IP = "px1.blockme.site";
              Port = 3128;
              Type = "HTTP";
            };
          };
        };

        systemd.services.qbittorrent = {
          serviceConfig.ExecStartPre =
            [
              # password
              "${lib.getExe pkgs.replace-secret} '@PASSWORD@' ${
                config.security.nix-secrets.secrets."services-qbittorrent-password".path
              } ${cfg.profileDir}/qBittorrent/config/qBittorrent.conf"
              # username
              "${lib.getExe pkgs.replace-secret} '@USERNAME@' ${
                config.security.nix-secrets.secrets."services-qbittorrent-username".path
              } ${cfg.profileDir}/qBittorrent/config/qBittorrent.conf"
            ]
            |> lib.mkAfter;
        };

        security.nix-secrets.secrets = {
          "services-qbittorrent-username" = {
            generator = "random-word";
            owner = cfg.user;
            # reloadUnits = [ "qbittorrent.service" ];
          };

          "services-qbittorrent-password" = {
            generator = "qbittorrent-password";
            owner = cfg.user;
            # reloadUnits = [ "qbittorrent.service" ];
          };
        };
      };
  };
}
