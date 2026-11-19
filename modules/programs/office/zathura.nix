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
      {
        home.packages = [
          self'.packages.zaread-wrapped
        ];

        programs.zathura = {
          enable = true;

          package = pkgs.zathura.override {
            useMupdf = true;
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
          defaultApplications = {
            "application/x-cbr" = "org.pwmt.zathura-cb.desktop";
            "application/x-cbz" = "org.pwmt.zathura-cb.desktop";
            "application/x-cb7" = "org.pwmt.zathura-cb.desktop";
            "application/x-cbt" = "org.pwmt.zathura-cb.desktop";

            "image/vnd.djvu" = "org.pwmt.zathura-djvu.desktop";
            "image/vnd.djvu+multipage" = "org.pwmt.zathura-djvu.desktop";

            "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
            "application/oxps" = "org.pwmt.zathura-pdf-mupdf.desktop";
            "application/epub+zip" = "org.pwmt.zathura-pdf-mupdf.desktop";
            "application/x-fictionbook" = "org.pwmt.zathura-pdf-mupdf.desktop";
            "application/x-mobipocket-ebook" = "org.pwmt.zathura-pdf-mupdf.desktop";

            "application/postscript" = "org.pwmt.zathura-ps.desktop";
            "application/eps" = "org.pwmt.zathura-ps.desktop";
            "application/x-eps" = "org.pwmt.zathura-ps.desktop";
            "image/eps" = "org.pwmt.zathura-ps.desktop";
            "image/x-eps" = "org.pwmt.zathura-ps.desktop";

            "application/msword" = "zaread.desktop";
            "application/vnd.ms-excel.sheet.binary.macroEnabled.12" = "zaread.desktop";
            "application/vnd.ms-excel.sheet.macroEnabled.12" = "zaread.desktop";
            "application/vnd.ms-excel" = "zaread.desktop";
            "application/vnd.ms-powerpoint.presentation.macroEnabled.12" = "zaread.desktop";
            "application/vnd.ms-powerpoint" = "zaread.desktop";
            "application/vnd.ms-word.document.macroEnabled.12" = "zaread.desktop";
            "application/vnd.oasis.opendocument.presentation" = "zaread.desktop";
            "application/vnd.oasis.opendocument.spreadsheet" = "zaread.desktop";
            "application/vnd.oasis.opendocument.text" = "zaread.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "zaread.desktop";
            "application/vnd.openxmlformats-officedocument.presentationml.slideshow" = "zaread.desktop";
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "zaread.desktop";
            "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "zaread.desktop";
            "application/vnd.openxmlformats-officedocument.wordprocessingml.template" = "zaread.desktop";
            "text/csv" = "zaread.desktop";
            "text/markdown" = "zaread.desktop";
            "text/rtf" = "zaread.desktop";
          };
        };
      };
  };
}
