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

    devshells = {
      canvas-commons =
        {
          pkgs,
          ...
        }:
        {
          devshell = {
            name = "canvas-commons";

            motd = ''
              {202}Welcome to devshell for Canvas-Commons{reset}
            '';

            packages = [
              pkgs.xdg-utils
              pkgs.nodejs
            ];

            startup = {
              open-links.text =
                # bash
                ''
                  xdg-open "http://localhost:9000"
                  xdg-open "https://canvascommons.io/docs"
                '';

              mkdir-projects.text =
                # bash
                ''
                  [ -d $CANVAS_DIR ] || mkdir -p $CANVAS_DIR  
                  cd $CANVAS_DIR
                '';

              startup-project.text =
                # bash
                ''
                  npm init @canvas-commons@latest -y --silent
                  read -p "Directory: " PROJECT_DIR; cd $PROJECT_DIR
                  npm --silent install; npm --silent start
                '';
            };
          };

          env = [
            {
              name = "CANVAS_DIR";
              eval = "$XDG_DOCUMENTS_DIR/Canvas-Commons";
            }
          ];
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
