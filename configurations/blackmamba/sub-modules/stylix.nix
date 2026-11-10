{
  ...
}:

{
  zen.hosts.blackmamba = {
    nixos =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      let
        colors = config.lib.stylix.colors;
      in
      {
        stylix = {
          polarity = "dark";

          base16Scheme = lib.mkForce {
            name = "Paradise";
            author = "https://github.com/manas140";
            base00 = "#151515";
            base01 = "#1f1f1f";
            base02 = "#2e2e2e";
            base03 = "#424242";
            base04 = "#bbb6b6";
            base05 = "#e8e3e3";
            base06 = "#e8e3e3";
            base07 = "#e8e3e3";
            base08 = "#b66467";
            base09 = "#d9bc8c";
            base0A = "#d9bc8c";
            base0B = "#8c977d";
            base0C = "#8aa6a2";
            base0D = "#8da3b9";
            base0E = "#a988b0";
            base0F = "#bbb6b6";
          };

          image = config.stylix.images.pepe-xp;

          icons = {
            enable = true;

            dark = "Papirus-Dark";
            light = "Papirus-Light";

            package = pkgs.papirus-icon-theme;
          };

          cursor = {
            size = 24;
            name = "googledot-custom";
            package = self'.packages.cursors-google-cursor.override {
              background_color = colors.withHashtag.base0E;
              outline_color = colors.withHashtag.base00;
              accent_color = colors.withHashtag.base0E;
            };
          };

          fonts = {
            monospace = {
              package = pkgs.nerd-fonts.caskaydia-cove;
              name = "CaskaydiaCove Nerd Font Propo";
            };

            sansSerif = {
              package = pkgs.inter;
              name = "Inter";
            };

            serif = {
              package = pkgs.inter;
              name = "Inter";
            };

            emoji = {
              package = pkgs.noto-fonts-color-emoji;
              name = "Noto Color Emoji";
            };

            sizes = {
              desktop = 12;
              popups = 12;
              applications = 14;
              terminal = 14;
            };
          };
        };

        fonts.packages = [
          # keep-sorted start
          pkgs.arkpandora_ttf
          pkgs.corefonts
          pkgs.gelasio
          pkgs.inter
          pkgs.liberation_ttf
          pkgs.monocraft
          pkgs.noto-fonts
          pkgs.noto-fonts-cjk-sans
          self'.packages.fonts-gost
          self'.packages.fonts-segoe
          # keep-sorted end
        ];
      };
  };
}
