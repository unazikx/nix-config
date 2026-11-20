{
  ...
}:

{
  zen.programs.office.zathura = {
    description = ''
      pdf viewer
      with zaread -> converts office into pdf
    '';

    homeManager =
      {
        self',
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.zathura;
        zaread = self'.packages.zaread-wrapped;
      in
      {
        home.packages = zaread |> lib.singleton;

        programs.zathura = {
          enable = true;

          package = pkgs.zathura.override {
            useMupdf = true;
            zathura_cb = pkgs.zathuraPkgs.zathura_cb.overrideAttrs (_: {
              postInstall = ''
                substituteInPlace $out/share/applications/org.pwmt.zathura-cb.desktop \
                  --replace-fail "inode/directory;" ""
              '';
            });
          };

          options = {
            guioptions = "none";

            selection-clipboard = "clipboard";
            smooth-scroll = true;

            window-title-home-tilde = true;
            statusbar-home-tilde = true;

            page-right-to-left = true;
            first-page-column = "1:1";

            font =
              [
                config.stylix.fonts.sansSerif.name
                (toString config.stylix.fonts.sizes.applications)
              ]
              |> lib.concatStringsSep " ";
          };

          mappings = {
            m = "toggle_page_mode";
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = [
            cfg.package
            zaread
          ];
        };
      };
  };
}
