{
  zen,
  ...
}:

{
  zen.services.mpd = {
    description = ''
      local media player
      use frontend for listen music
      https://wiki.archlinux.org/title/Music_Player_Daemon#Clients
    '';

    includes = [
      zen.services.playerctld
    ];

    homeManager =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.services.mpd;
      in
      {
        services.mpd = {
          enable = true;
          # music dir as default is xdg music

          extraConfig = ''
            auto_update "yes"

            audio_output {
              type   "fifo"
              name   "MPD Visualizer"
              format "44100:16:2"
              path   "${cfg.dataDir}/visualizer.fifo"
            }

            audio_output {
              type "pipewire"
              name "MPD PipeWire"
            }
          '';

          network = {
            startWhenNeeded = true;
          };
        };

        services.mpd-mpris = {
          enable = true;

          mpd.useLocal = true;
        };

        services.mpd-discord-rpc = {
          enable = true;

          settings = {
            hosts = [
              (
                [
                  cfg.network.listenAddress
                  (toString cfg.network.port)
                ]
                |> lib.concatStringsSep ":"
              )
            ];

            format = {
              details = "$title ($$duration)";
              state = "$artist / $album ($date)";
              large_image = "url";
              small_image = "url";
            };
          };
        };

        services.mpdscribble.enable = true;

        services.mpdscribble = {
          endpoints = {
            "last.fm" = {
              passwordFile = config.security.nix-secrets.secrets."services-mpd".path;
              username = "azikx6"; # cause azikx was taken already... eh...
            };

            "libre.fm" = {
              passwordFile = config.security.nix-secrets.secrets."services-mpd".path;
              username = "_azikx";
            };
          };
        };

        security.nix-secrets.secrets = {
          "services-mpd" = { };
        };
      };
  };
}
