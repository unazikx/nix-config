{
  ...
}:

{
  zen.programs.desktop.tofi = {
    description = ''
      just GOAT launcher
    '';

    homeManager =
      {
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        fonts = config.stylix.fonts;
      in
      {
        programs.tofi = {
          enable = true;

          settings = {
            history = false;
            hide-cursor = true;
            text-cursor = true;

            font = fonts.monospace.name;

            width = "100%";
            height = "100%";

            border-width = 0;
            outline-width = 0;

            padding-left = "30%";
            padding-right = "30%";
            padding-top = "20%";
            padding-bottom = "20%";

            result-spacing = 25;
            num-results = 9;

            background-color = colors.base00;
            text-color = colors.base05;

            prompt-color = colors.base04;
            input-color = colors.base04;
            selection-color = colors.base0E;
            default-result-color = colors.base03;

            selection-background = colors.base01;
            selection-background-padding = 8;
            selection-background-corner-radius = 18;
          };
        };

        stylix.targets = {
          tofi.enable = false;
        };
      };
  };
}
