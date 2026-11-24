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

        xdg.dataFile."Hytale/settings.json".source = json.generate "hytale-settings.json" {
          disable_window_controls = true;
          language = "ru";
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
            (inputs'.hytale-nix.packages.hytale-launcher.override (_old: {
              targetPkgs =
                _pkgs:
                (_old.targetPkgs _pkgs)
                ++ [
                  _pkgs.glib-networking
                  _pkgs.cacert
                ];

              runScript = pkgs.writeShellScript "hytale-launcher-wrapper" ''
                DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/Hytale"
                BIN="$DIR/hytale-launcher"
                STAMP="$DIR/.bundled_path"

                mkdir -p "$DIR/.nix-tmp"

                if [ ! -x "$BIN" ] || [ "$(cat "$STAMP" 2>/dev/null)" != "${_old.runScript}" ]; then
                  install -m755 "${_old.runScript}" "$BIN"
                  echo "${_old.runScript}" > "$STAMP"
                fi

                export GIO_MODULE_DIR=/usr/lib/gio/modules
                export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
                export TMPDIR="$DIR/.nix-tmp"
                export __NV_DISABLE_EXPLICIT_SYNC=1
                export WEBKIT_DISABLE_COMPOSITING_MODE=1
                export WEBKIT_DISABLE_DMABUF_RENDERER=1
                unset XDG_CACHE_HOME

                exec "$BIN" "$@"
              '';
            }))

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

          postBuild =
            # bash
            ''
              install -Dm644 ${
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
