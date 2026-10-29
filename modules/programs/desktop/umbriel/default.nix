{
  zen,
  ...
}:

{
  flake-file.inputs = {
    # keep-sorted start block=yes newline_separated=yes
    umbriel = {
      type = "github";
      owner = "noctalia-dev";
      repo = "umbriel";
    };
    # keep-sorted end
  };

  zen.programs.desktop.umbriel = {
    description = ''
      modern window manager
      from authors Noctalia
    '';

    includes = [
      zen.programs.desktop.keyring
      zen.programs.desktop.noctalia
      zen.programs.desktop.sunsetr
      zen.programs.desktop.umbriel.binds
      zen.programs.desktop.umbriel.rules
      zen.programs.desktop.umbriel.settings
      zen.programs.desktop.uwsm
      zen.programs.terminal.foot
    ];

    meta = {
      layout = "scrolling";
      workspaceCount = 8;
    };

    wiki = {
      "Umbriel" = {
        links = [
          {
            name = "umbriel-wiki";
            link = "https://docs.noctalia.dev/umbriel";
            logo = "https://docs.noctalia.dev/_astro/noctalia-logo.BwXc-yKG.svg";
          }
        ];
      };
    };

    nixos =
      {
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.umbriel;
      in
      {
        programs.umbriel = {
          enable = true;
        };

        programs.uwsm = {
          waylandCompositors.umbriel = {
            prettyName = "Umbriel";
            binPath = lib.getExe cfg.package;
          };
        };
      };

    homeManager =
      {
        inputs,
        pkgs,
        osConfig,
        ...
      }:
      let
        osCfg = osConfig.programs.umbriel;
      in
      {
        imports = [
          inputs.umbriel.homeModules.default
        ];

        programs.umbriel = {
          inherit (osCfg)
            enable
            package
            ;
        };

        xdg = {
          portal = {
            config.umbriel = {
              default = [ "umbriel" ];
              "org.freedesktop.impl.portal.FileChooser" = "gtk";
              "org.freedesktop.impl.portal.OpenURI" = "gtk";
              "org.freedesktop.impl.portal.ScreenCast" = "umbriel";
              "org.freedesktop.impl.portal.Screenshot" = "umbriel";
            };

            extraPortals = [
              osCfg.portalPackage
              pkgs.xdg-desktop-portal-gtk
              pkgs.xdg-desktop-portal-termfilechooser
            ];
          };

          terminal-exec = {
            settings.umbriel = [ "foot.desktop" ];
          };
        };
      };
  };
}
