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

        notifyScript = pkgs.writeShellScript "mail-notify" ''
          NOTMUCH="${lib.getExe notmuch.package}"
          JQ="${lib.getExe pkgs.jq}"
          NOTIFY="${lib.getExe pkgs.libnotify}"

          "$NOTMUCH" new > /dev/null

          "$NOTMUCH" search --format=json tag:new | "$JQ" -c '.[]' | while IFS= read -r item; do
            THREAD=$(printf '%s' "$item" | "$JQ" -r '.thread')
            AUTHORS=$(printf '%s' "$item" | "$JQ" -r '.authors // "Unknown"')
            SUBJECT=$(printf '%s' "$item" | "$JQ" -r '.subject // "(No subject)"')

            SENDER=$("$NOTMUCH" show --format=json "thread:$THREAD and tag:new" \
              | "$JQ" -r --arg fallback "$AUTHORS" 'first(.. | objects | .headers?.From? // empty) // $fallback')

            "$NOTIFY" \
              --icon gmail \
              --app-name Imapnotify \
              "$SENDER" \
              "$SUBJECT"
          done

          "$NOTMUCH" tag -new -- tag:new
        '';
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
            passwordCommand = "${lib.getExe' pkgs.coreutils "cat"} ${
              config.security.nix-secrets.secrets."email-personal-password".path
            }";

            signature = {
              showSignature = "append";

              text = ''
                Warm regards,
                ${_self.realName} / ${_self.userName}
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

              onNotify = "${lib.getExe mbsync.package} 'Personal:%s'";
              onNotifyPost = toString notifyScript;

              extraArgs = [
                "-wait 5"
              ];
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
            new = {
              tags = [
                "unread"
                "inbox"
                "new"
              ];

              ignore = [
                "[Gmail]/Spam"
                "[Gmail]/Trash"
              ];
            };
          };
        };

        services.imapnotify = {
          enable = true;
        };

        services.mbsync = {
          enable = true;
          postExec = toString notifyScript;
        };

        security.nix-secrets.secrets = {
          "email-personal-password" = { };
        };
      };
  };
}
