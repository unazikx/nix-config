{
  zen,
  ...
}:

{
  zen.programs.cli.aerc = {
    description = ''
      tui client for emails
    '';

    includes = [
      zen.programs.cli.handlr
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        cfg = config.programs.aerc;
      in
      {
        programs.aerc = {
          enable = true;

          extraConfig = {
            general = {
              unsafe-accounts-conf = true;
              default-save-path = "~/Downloads";
            };

            ui = {
              sort = "-r date";
              threading-enabled = true;
              mouse-enabled = false;
              sidebar-width = 24;
              fuzzy-complete = true;
              timestamp-format = "15:04 02.01.2006";
              this-day-time-format = "15:04";
              this-year-time-format = "15:04 02.01";

              icon-unencrypted = "";
              icon-encrypted = "✔";
              icon-signed = "✔";
              icon-signed-encrypted = "✔";
              icon-unknown = "✘";
              icon-invalid = "⚠";
            };

            compose = {
              address-book-cmd = "${lib.getExe pkgs.khard} email --parsable --remove-first-line %s";
              file-picker-cmd = "${lib.getExe config.programs.fzf.package} --multi --query=%s";
              empty-subject-warning = true;
            };

            viewer = {
              alternatives = "text/plain,text/html";
              header-layout = "From|To,Cc|Bcc,Date,Subject";
            };

            filters = {
              "text/html" = "${lib.getExe pkgs.w3m} -I UTF-8 -T text/html -dump";
              "text/plain" = "colorize";
              "message/delivery-status" = "colorize";
              "message/rfc822" = "colorize";
            };

            openers = {
              "text/html" = "xdg-open";
              "image/*" = "xdg-open";
              "application/pdf" = "xdg-open";
            };
          };

          extraBinds = {
            global = {
              "<C-p>" = ":prev-tab<Enter>";
              "<C-n>" = ":next-tab<Enter>";
              "<C-r>" = ":reload<Enter>";
              "<C-t>" = ":term<Enter>";
              "?" = ":help keys<Enter>";
            };

            messages = {
              "q" = ":quit<Enter>";

              "j" = ":next<Enter>";
              "k" = ":prev<Enter>";
              "<Down>" = ":next<Enter>";
              "<Up>" = ":prev<Enter>";

              "J" = ":next-folder<Enter>";
              "K" = ":prev-folder<Enter>";
              "<S-Down>" = ":next-folder<Enter>";
              "<S-Up>" = ":prev-folder<Enter>";

              "H" = ":collapse-folder<Enter>";
              "L" = ":expand-folder<Enter>";

              "g" = ":select 0<Enter>";
              "G" = ":select -1<Enter>";

              "l" = ":view<Enter>";
              "<Enter>" = ":view<Enter>";

              "D" = ":delete<Enter>";
              "A" = ":archive flat<Enter>";

              "c" = ":compose<Enter>";
              "r" = ":reply -a<Enter>";
              "R" = ":reply<Enter>";

              "f" = ":forward<Enter>";
              "u" = ":unread -t<Enter>";
              "*" = ":flag -t<Enter>";
              "T" = ":toggle-threads<Enter>";

              "/" = ":search ";
              "<C-r>" = ":check-mail<Enter>";

              "v" = ":mark -t<Enter>";
              "V" = ":mark -v<Enter>";
              "<Space>" = ":mark -t<Enter>:next<Enter>";
            };

            view = {
              "q" = ":close<Enter>";

              "j" = ":next-part<Enter>";
              "k" = ":prev-part<Enter>";

              "o" = ":open<Enter>";
              "s" = ":save ";

              "d" = '':move "Trash"<Enter>'';
              "D" = ":delete<Enter>";

              "r" = ":reply -a<Enter>";
              "f" = ":forward<Enter>";

              "A" = ":archive flat<Enter>";
              "/" = ":search ";
            };

            compose = {
              "$noinherit" = "true";
              "$ex" = "<C-x>";
              "$complete" = "<Tab>";
              "<C-j>" = ":next-field<Enter>";
              "<C-k>" = ":prev-field<Enter>";
              "<C-p>" = ":prev-tab<Enter>";
              "<C-n>" = ":next-tab<Enter>";
            };

            "compose::editor" = {
              "$noinherit" = "true";
              "$ex" = "<C-x>";
              "<C-k>" = ":prev-field<Enter>";
              "<C-j>" = ":next-field<Enter>";
              "<C-p>" = ":prev-tab<Enter>";
              "<C-n>" = ":next-tab<Enter>";
            };

            "compose::review" = {
              "y" = ":send<Enter>";
              "n" = ":abort<Enter>";
              "v" = ":preview<Enter>";
              "p" = ":postpone<Enter>";
              "q" = ":choose -o d discard abort -o p postpone postpone<Enter>";
              "e" = ":edit<Enter>";
              "a" = ":attach<space>";
              "d" = ":detach<space>";
            };

            terminal = {
              "$noinherit" = "true";
              "$ex" = "<C-x>";
              "<C-p>" = ":prev-tab<Enter>";
              "<C-n>" = ":next-tab<Enter>";
            };
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };
      };
  };
}
