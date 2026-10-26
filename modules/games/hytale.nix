{
  zen,
  ...
}:

{
  zen.games.hytale = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        {
          name = "nix-package-previous";
          link = "https://github.com/unazikx/hytale-launcher-nix";
          logo = "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/hytale.png";
        }
        {
          name = "hytale-seeds-viewer";
          link = "https://hyseeds.ru";
          logo = "https://hyseeds.ru/assets/logo-640.png";
        }
      ];
    };

    meta = {
      package = pkgs: pkgs.hytale-launcher-wrapped;
    };

    homeManagerNixos =
      {
        self',
        pkgs,
        lib,
        user,
        ...
      }:
      let
        meta = zen.games.hytale.meta;
        game = meta.package self'.packages;

        json = pkgs.formats.json { };
      in
      [
        {
          home.packages = [ game ];

          xdg.dataFile = {
            "Hytale/settings.json".source = json.generate "hytale-settings.json" {
              disable_window_controls = true;
              language = "ru";
            };
          };
        }
        (
          {
            "Hytale" = {
              target = game;
            };
          }
          |> lib.optionalAttrs (user.hasAspect zen.games.steam)
          |> (nonSteamApps: {
            programs.steam.config.nonSteamApps = nonSteamApps;
          })
        )
      ]
      |> lib.mkMerge;
  };
}
