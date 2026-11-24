{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    hytale-nix = {
      type = "github";
      owner = "andreashgk";
      repo = "hytale-nix";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    # keep-sorted end
  };

  zen.games.hytale = {
    description = ''
      official launcher for hytale
      built from zip archive instead flatpak
    '';

    wiki = {
      "Hytale Launcher".links = [
        {
          name = "hytale-seeds-viewer";
          link = "https://hyseeds.ru";
          logo = "https://hyseeds.ru/assets/logo-640.png";
        }
      ];
    };

    homeManagerNixos =
      {
        self',
        pkgs,
        ...
      }:
      let
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          self'.packages.hytale-launcher
        ];

        xdg.dataFile = {
          "Hytale/settings.json".source = json.generate "hytale-settings.json" {
            disable_window_controls = true;
            language = "ru";
          };
        };
      };

    packages =
      {
        inputs',
        pkgs,
        lib,
        ...
      }:
      {
        hytale-launcher = pkgs.symlinkJoin {
          name = "hytale-launcher";

          paths = [
            inputs'.hytale-nix.packages.hytale-launcher
            (pkgs.makeDesktopItem {
              name = "hytale";
              desktopName = "Hytale Launcher";

              comment = "Official launcher for Hytale";

              exec = "hytale-launcher %U";
              icon = "hytale-launcher";

              keywords = [
                "hytale"
                "game"
                "launcher"
                "hypixel"
              ];

              categories = [ "Game" ];
            })
          ];

          postBuild = ''
            mkdir -p $out/share/icons/hicolor/256x256/apps
            cp ${
              pkgs.fetchurl {
                url = "https://hytale.com/_astro/logo-h.DGX5BvcL.webp";
                sha256 = "sha256-9z9ouxEgijhGxtQEJDYdv+yEzQ6CqoZG6LJzCC6/8u0=";
              }
            } $out/share/icons/hicolor/256x256/apps/hytale-launcher.png
          '';

          meta = {
            description = "Official launcher for Hytale game";
            homepage = "https://hytale.com";
            license = lib.licenses.unfree;
            mainProgram = "hytale-launcher";
          };
        };
      };
  };

  zen.flake-parts.default = {
    includes = [ zen.games.hytale ];
  };
}
