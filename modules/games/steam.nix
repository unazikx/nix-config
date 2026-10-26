{
  zen,
  ...
}:

{
  zen.games.steam = {
    description = ''
      for unified prefix use:
      STEAM_COMPAT_DATA_PATH=your_path_withouts_strings_around %command%

      config options:
      https://different-name.github.io/steam-config-nix
    '';

    includes = [
      zen.games.gamemode
      zen.games.mangohud
      zen.games.steam-config
      zen.games.wine
    ];

    meta = {
      fps = 60;
    };

    wiki = {
      "Steam" = {
        extra = ''
          my steam links:
          profile -> https://steamcommunity.com/id/literaly-custom-url
          steamdb -> https://steamdb.info/calculator/76561199046023228
          protondb -> https://www.protondb.com/users/1633163188
        '';

        links = [
          {
            name = "arch-steam";
            link = "https://wiki.archlinux.org/title/Steam";
            logo = "https://www.vhv.rs/dpng/d/76-762941_archlinux-icon-crystal-arch-linux-icon-png-transparent.png";
          }
          {
            name = "jovian-nixos";
            link = "https://github.com/Jovian-Experiments/Jovian-NixOS";
            logo = "https://images.seeklogo.com/logo-png/40/2/steam-deck-logo-png_seeklogo-409559.png";
          }
          {
            name = "proton-db";
            link = "https://protondb.com";
            logo = "https://www.protondb.com/sites/protondb/images/site-logo.svg";
          }
          {
            name = "steam-db";
            link = "https://steamdb.info";
            logo = "https://wiki.archiveteam.org/images/d/d8/SteamDB_logo.png";
          }
          {
            name = "steam-peek";
            link = "https://steampeek.hu";
            logo = "https://steampeek.hu/s_style/images/sp_logo_g.png";
          }
        ];
      };
    };

    nixos =
      {
        self',
        pkgs,
        lib,
        ...
      }:
      {
        programs = {
          steam = {
            enable = true;

            extraCompatPackages = lib.attrValues {
              "GE-Proton" = self'.packages.proton-ge;
            };

            remotePlay.openFirewall = true;

            protontricks = {
              enable = true;
            };

            gamescopeSession = {
              enable = true;

              env = {
                # WINE_FULLSCREEN_FSR = "1";
              };

              args = [
                "-e"
              ];
            };
          };

          gamescope = {
            enable = true;
          };
        };

        environment.systemPackages = [
          # WARN:
          # idk it isnt works
          (pkgs.writeShellScriptBin "steamos-session-select" ''
            steam -shutdown
          '')
        ];
      };

    homeManagerNixos =
      {
        lib,
        osConfig,
        ...
      }:
      {
        xdg.dataFile = {
          # for beta steam client
          "Steam/package/beta".text = "publicbeta";
        };

        systemd.user.services = {
          steam-autostart = {
            Unit = {
              PartOf = [ "graphical-session.target" ];
              After = [ "graphical-session.target" ];
            };

            Install = {
              WantedBy = [ "graphical-session.target" ];
            };

            Service = {
              ExecStart = lib.concatStringsSep " " [
                (lib.getExe osConfig.programs.steam.package)
                "-nochatui"
                "-nofriendsui"
              ];

              Restart = "always";
            };
          };
        };
      };
  };

  zen.flake-parts.default = {
    includes = [ zen.games.steam ];
  };
}
