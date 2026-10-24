{
  zen,
  ...
}:

{
  zen.miscellaneous.canvas-commons = {
    wiki = {
      "Canvas-Commons".links = [
        {
          name = "main-page";
          link = "https://canvascommons.io";
          logo = "https://canvascommons.io/img/logo_dark.svg";
        }
        {
          name = "documentation";
          link = "https://canvascommons.io/docs";
          logo = "https://canvascommons.io/img/logo_dark.svg";
        }
        {
          name = "api";
          link = "https://canvascommons.io/api/core";
          logo = "https://canvascommons.io/img/logo_dark.svg";
        }
      ];
    };

    homeManagerNixos =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        json = pkgs.formats.json { };
      in
      {
        home.packages = [
          self'.packages.canvas-commons
        ];

        home.file = {
          ".canvas-commons/settings.json".source = json.generate "canvas-commons-config.json" {
            version = 1;
            appearance = {
              color = "rgb(${
                [
                  colors.base0B-rgb-r
                  colors.base0B-rgb-g
                  colors.base0B-rgb-b
                ]
                |> lib.concatStringsSep " "
              })";
              font = true;
              coordinates = true;
              nodeCoordinates = true;
            };
            defaults = {
              background = null;
              size = {
                x = 1920;
                y = 1080;
              };
            };
          };
        };
      };

    packages =
      {
        pkgs,
        ...
      }:
      {
        canvas-commons = pkgs.writeShellApplication {
          name = "canvas-commons";

          derivationArgs = {
            allowSubstitutes = false;
            preferLocalBuild = true;
          };

          runtimeInputs = [
            pkgs.xdg-utils
            pkgs.nodejs
          ];

          text = ''
            CANVAS_DIR="$XDG_VIDEOS_DIR/Canvas-Commons"
            [ -d "$CANVAS_DIR" ] || mkdir -p "$CANVAS_DIR"

            xdg-open "http://localhost:9000"
            xdg-open "https://canvascommons.io/docs"

            read -rp "Project name: " PROJECT

            [ ! -d "$CANVAS_DIR/$PROJECT" ] && npm init @canvas-commons@latest --silent \
              -- --name="$PROJECT" --path="$CANVAS_DIR/$PROJECT" --language=ts --plugins=webcodecs -y
            cd "$CANVAS_DIR/$PROJECT"; npm --silent install; npm --silent start
          '';
        };
      };

    wrappers = { };
  };

  zen.flake-system.default = {
    includes = [ zen.miscellaneous.canvas-commons ];
  };

  zen.flake-parts.default = {
    includes = [ zen.miscellaneous.canvas-commons ];
  };
}
