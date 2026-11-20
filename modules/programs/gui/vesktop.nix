{
  zen,
  ...
}:

{
  zen.programs.gui.vesktop = {
    description = ''
      modded discord client
    '';

    includes = [
      zen.services.proxy-suite
      # pls use zapret
    ];

    homeManagerNixos =
      {
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors.withHashtag;
        cfg = config.programs.vesktop;
      in
      {
        programs.vesktop = {
          enable = true;

          settings = {
            appBadge = false;
            arRPC = true;

            nativeTitleBar = true;
            customTitleBar = false;
            staticTitle = true;

            enableShadow = true;
            enableRoundedCorners = true;

            hardwareAcceleration = true;
            hardwareVideoAcceleration = true;

            splashTheming = true;
            splashBackground = colors.base00;
            splashColor = colors.base0D;

            checkUpdates = false;
            discordBranch = "stable";

            tray = true;
            minimizeToTray = true;
          };

          vencord.settings = {
            autoUpdate = false;
            autoUpdateNotification = false;

            useQuickCss = true;
            frameless = true;
            transparent = false;

            plugins =
              lib.genAttrs
                [
                  # keep-sorted start
                  "AlwaysAnimate"
                  "AlwaysTrust"
                  "BetterGifPicker"
                  "FakeNitro"
                  "Translate"
                  # keep-sorted end
                ]
                (_: {
                  enable = true;
                });
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
