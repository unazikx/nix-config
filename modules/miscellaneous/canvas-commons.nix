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

    wrappers = { };
  };

  perSystem =
    {
      pkgs,
      ...
    }:
    {
      devShells.canvas-commons = pkgs.mkShell {
        packages = [
          pkgs.xdg-utils
          pkgs.nodejs
        ];

        shellHook =
          # bash
          ''
            CANVAS_DIR=$XDG_DOCUMENTS_DIR/Canvas-Commons

            xdg-open "http://localhost:9000"
            xdg-open "https://canvascommons.io/docs"

            [ -d $CANVAS_DIR ] || mkdir -p $CANVAS_DIR  
            cd $CANVAS_DIR

            npm init @canvas-commons@latest -y --silent
            read -p "Directory: " PROJECT_DIR; cd $PROJECT_DIR
            npm --silent install; npm --silent start
          '';
      };
    };

  zen.flake-system.default = {
    includes = [ zen.miscellaneous.canvas-commons ];
  };

  zen.flake-parts.default = {
    includes = [ zen.miscellaneous.canvas-commons ];
  };
}
