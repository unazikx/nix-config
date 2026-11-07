{
  zen,
  ...
}:

{
  # flake-file.inputs = {
  #   # keep-sorted start block=yes newline_separated=yes
  #   scroll-flake = {
  #     type = "github";
  #     owner = "diax170";
  #     repo = "scroll-flake";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };
  #   # keep-sorted end
  # };

  zen.programs.desktop.scroll = {
    description = ''
      based on sway
      but moves like niri, scrolls horizontal
      ill try it
    '';

    includes = [
      zen.programs.desktop.clapboard
      zen.programs.desktop.dunst
      zen.programs.desktop.i3status-rust
      zen.programs.desktop.keyring
      zen.programs.desktop.scroll.bar
      zen.programs.desktop.scroll.binds
      zen.programs.desktop.scroll.rules
      zen.programs.desktop.scroll.settings
      zen.programs.desktop.scroll.specific
      zen.programs.desktop.sunsetr
      zen.programs.desktop.tofi
      zen.programs.desktop.wayshot
      zen.programs.terminal.foot
    ];

    nixos =
      {
        inputs,
        inputs',
        ...
      }:
      {
        imports = [
          inputs.scroll-flake.nixosModules.default
        ];

        programs.scroll = {
          enable = true;
          package = inputs'.scroll-flake.packages.scroll-git;
        };
      };

    homeManagerNixos =
      {
        inputs,
        pkgs,
        osConfig,
        ...
      }:
      {
        imports = [
          inputs.scroll-flake.homeModules.default
        ];

        wayland.windowManager.scroll = {
          enable = true;

          xwayland = true;
          systemd.enable = true;

          package = osConfig.programs.scroll.package;

          checkConfig = false;
        };

        xdg = {
          portal = {
            config.scroll = {
              default = [
                "wlr"
                "gtk"
              ];
              "org.freedesktop.impl.portal.FileChooser" = "gtk";
              "org.freedesktop.impl.portal.OpenURI" = "gtk";
              "org.freedesktop.impl.portal.ScreenCast" = "wlr";
              "org.freedesktop.impl.portal.Screenshot" = "wlr";
            };

            # i know
            # https://github.com/sodiboo/niri-flake/blob/74053f79cad0f6c3a4a0be6b7928795d2e6a9f4b/flake.nix#L559
            extraPortals = [ pkgs.xdg-desktop-portal-wlr ];
          };

          terminal-exec = {
            settings.scroll = [ "foot.desktop" ];
          };
        };
      };
  };
}
