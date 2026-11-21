{
  zen,
  ...
}:

{
  zen.programs.office.email = {
    includes = [
      zen.programs.cli.aerc
      zen.programs.office.vdirsyncer
    ];

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        mbsync = config.programs.mbsync;
        notmuch = config.programs.notmuch;
      in
      {
        accounts.email.maildirBasePath = ".maildir";

        accounts.email.accounts = {
          "Personal" = lib.fix (_self: {
            primary = true;

            realName = "Aziz Kurbonov";
            address = "xfalwa@gmail.com";
            userName = "xfalwa@gmail.com";

            flavor = "gmail.com";
            passwordCommand = "cat ${config.security.nix-secrets.secrets."accounts-email-personal".path}";

            signature = {
              showSignature = "append";

              text = ''
                Warm regards,
                ${config.me.fullname}
              '';
            };

            folders = {
              inbox = "INBOX";
              drafts = "[Gmail]/Drafts";
              sent = "[Gmail]/Sent Mail";
              trash = "[Gmail]/Trash";
            };

            aerc = {
              enable = true;

              extraAccounts = {
                default = "Inbox";
                archive = "All Mail";
                postpone = "Drafts";

                copy-to = "";
                check-mail = "0m";
                check-mail-cmd = "systemctl --user restart mbsync.service";
                strip-bcc = true;

                multi-file-strategy = "act-dir";

                folders-sort = lib.concatStringsSep "," [
                  "Inbox"
                  "All Mail"
                  "Sent"
                  "Drafts"
                  "Spam"
                  "Trash"
                ];

                folder-map =
                  pkgs.writeText "aerc-folder-map" ''
                    Inbox = INBOX
                    All Mail = [Gmail]/All Mail
                    Drafts = [Gmail]/Drafts
                    Sent = [Gmail]/Sent Mail
                    Spam = [Gmail]/Spam
                    Trash = [Gmail]/Trash
                  ''
                  |> toString;
              };

              extraBinds = {
                messages = {
                  "d" = '':move "Trash"<Enter>'';

                  "gi" = '':cf "Inbox"<Enter>'';
                  "gs" = '':cf "Sent"<Enter>'';
                  "gd" = '':cf "Drafts"<Enter>'';
                  "gt" = '':cf "Trash"<Enter>'';

                  "mi" = '':move "Inbox"<Enter>'';
                  "ms" = '':move "Sent"<Enter>'';
                  "md" = '':move "Drafts"<Enter>'';
                  "mt" = '':move "Trash"<Enter>'';
                };

                view = {
                  "d" = '':move "Trash"<Enter>'';

                  "mi" = '':move "Inbox"<Enter>'';
                  "ms" = '':move "Sent"<Enter>'';
                  "md" = '':move "Drafts"<Enter>'';
                  "mt" = '':move "Trash"<Enter>'';
                };
              };
            };

            meli = {
              enable = true;

              mailboxes = [
                "Inbox"
                "All Mail"
                "Drafts"
                "Sent"
                "Spam"
                "Trash"
              ];

              mailboxAliases = {
                "INBOX".alias = "Inbox";
                "[Gmail]/All Mail".alias = "All Mail";
                "[Gmail]/Drafts".alias = "Drafts";
                "[Gmail]/Sent Mail".alias = "Sent";
                "[Gmail]/Spam".alias = "Spam";
                "[Gmail]/Trash".alias = "Trash";
              };
            };

            imapnotify = {
              enable = true;

              boxes = [ "INBOX" ];

              extraConfig = {
                new.ignore = [
                  "[Gmail]/Spam"
                  "[Gmail]/Trash"
                ];
              };

              onNotify = "${lib.getExe mbsync.package} 'Personal:%s'";
              onNotifyPost = "${lib.getExe notmuch.package} new";
            };

            mbsync = {
              enable = true;

              create = "both";
              expunge = "both";
              remove = "none";

              subFolders = "Verbatim";

              patterns =
                # ! is ignores
                [
                  "*"
                  "![Gmail]/Important"
                  "![Gmail]/Starred"
                ];

              extraConfig = {
                channel.CopyArrivalDate = "yes";
              };
            };

            msmtp.enable = true;

            notmuch.enable = true;
          });
        };

        programs.mbsync = {
          enable = true;
        };

        programs.notmuch = {
          enable = true;

          settings = {
            new.ignore = [
              "[Gmail]/Spam"
              "[Gmail]/Trash"
            ];
          };
        };

        services.imapnotify = {
          enable = true;
        };

        services.mbsync = {
          enable = true;

          postExec = "${lib.getExe notmuch.package} new";
        };

        security.nix-secrets.secrets = {
          "accounts-email-personal" = { };
        };
      };
  };
}
