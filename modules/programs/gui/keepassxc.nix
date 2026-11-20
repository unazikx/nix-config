{
  ...
}:

{
  zen.programs.gui.keepassxc = {
    description = ''
      local password manager
      very good/goon ahahah
    '';

    homeManager =
      {
        pkgs,
        lib,
        config,
        ...
      }:
      let
        ini = pkgs.formats.ini { };
        cfg = config.programs.keepassxc;
        pwdir = config.xdg.userDirs.publicShare;
      in
      {
        programs.keepassxc = {
          enable = true;

          settings = {
            # keep-sorted start block=yes newline_separated=yes
            Browser = {
              Browser_AllowLocalhostWithPasskeys = true;
              BrowserType = "Firefox";
              Enabled = true;
              UseCustomBrowser = true; # default is firefox
            };

            FdoSecrets.Enabled = true;

            GUI = {
              ApplicationTheme = "classic";
              ColorPasswords = true;
              CompactMode = true;
              HideGroupPanel = true;
              HideGroupsPanel = false;
              HideMenubar = false;
              HidePasswords = true;
              HidePreviewPanel = false;
              HideToolbar = true;
              MinimizeOnClose = true;
              MinimizeToTray = true;
              MonospaceNotes = true;
              ShowTrayIcon = true;
              TrayIconAppearance =
                if (config.stylix.polarity == "dark") then
                  "monochrome-dark"
                else if (config.stylix.polarity == "light") then
                  "monochrome-light"
                else
                  "colorful";
            };

            General = {
              AutoReloadOnChange = true;
              AutoSaveAfterEveryChange = true;
              AutoSaveOnExit = true;
              BackupBeforeSave = true;
              BackupFilePathPattern = "{DB_FILENAME}_old.kdbx";
              ConfigVersion = 2;
              OpenPreviousDatabasesOnStartup = true;
              RememberLastDatabases = true;
              RememberLastKeyFiles = true;
            };

            PasswordGenerator = {
              Length = 32;

              AdvancedMode = true;
              Braces = true;
              Dashes = true;
              EASCII = true;
              Logograms = true;
              LowerCase = true;
              Math = true;
              Numbers = true;
              Quotes = true;
              SpecialChars = true;
              UpperCase = true;
            };

            SSHAgent.Enabled = true;

            Security = {
              ClearClipboardTimeout = 12; # sec
              ClearSearch = true;
              IconDownloadFallback = true;
              LockDatabaseIdle = true;
              LockDatabaseIdleSeconds = 60 * 30; # half hour
              LockDatabaseScreenLock = false;
              Security_HideNotes = true;
            };
            # keep-sorted end
          };
        };

        xdg.mimeApps = {
          defaultApplicationPackages = cfg.package |> lib.singleton;
        };

        xdg.cacheFile = {
          "keepassxc/keepassxc.ini".source =
            {
              General = {
                LastDir = "${pwdir}/keepass";
                LastActiveDatabase = "${pwdir}/keepass/db.kdbx";
                LastDatabases = "${pwdir}/keepass/db.kdbx";
                LastOpenedDatabases = "${pwdir}/keepass/db.kdbx";
              };

              GUI = {
                GroupSplitterState = "640, 340";
                ListViewState = ''@ByteArray(\0\0\0\xff\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\x1\x1\0\0\0\x11\0\0\0\0\0\0\0\x4\0\0\0\x5\0\0\0\x6\0\0\0\a\0\0\0\b\0\0\0\t\0\0\0\n\0\0\0\v\0\0\0\f\0\0\0\x1\0\0\0\r\0\0\0\x3\0\0\0\xe\0\0\0\x2\0\0\0\xf\0\0\0\x10\0\0\0\x11\0\0\0\0\0\0\0\n\0\0\0\xe\0\0\0\f\0\0\0\x1\0\0\0\x2\0\0\0\x3\0\0\0\x4\0\0\0\x5\0\0\0\x6\0\0\0\a\0\0\0\b\0\0\0\t\0\0\0\v\0\0\0\r\0\0\0\xf\0\0\0\x10\0\0\0\x11\x63\xf7\0\0\0\0\v\0\0\0\r\0\0\0\x64\0\0\0\xf\0\0\0\x1a\0\0\0\t\0\0\0\x64\0\0\0\v\0\0\0\x64\0\0\0\n\0\0\0\x1a\0\0\0\x5\0\0\0o\0\0\0\a\0\0\0\x64\0\0\0\x6\0\0\0\x64\0\0\0\0\0\0\0\x64\0\0\0\x3\0\0\0\x64\0\0\0\x2\0\0\0\xf6\0\0\x3\xe3\0\0\0\x11\x1\x1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x64\0\0\0\x1\0\0\0\x81\0\0\0\0\0\0\0\x11\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\x1a\0\0\0\x1\0\0\0\x2\0\0\0\x1a\0\0\0\x1\0\0\0\x2\0\0\x1\v\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\x1\xab\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\xf9\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\0\0\0\0\0\x1\0\0\0\0\0\0\x3\xe8\x1\0\0\0\x64)'';
                MainWindowGeometry = ''@ByteArray(\x1\xd9\xd0\xcb\0\x3\0\0\0\0\0\0\0\0\0\0\0\0\x3\xae\0\0\x4\b\0\0\0\0\0\0\0\0\0\0\x3\xae\0\0\x4\b\0\0\0\0\x2\0\0\0\a\x80\0\0\0\0\0\0\0\0\0\0\x3\xae\0\0\x4\b)'';
                MainWindowState = ''@ByteArray(\0\0\0\xff\0\0\0\0\xfd\0\0\0\0\0\0\x3\xaf\0\0\x3\xcc\0\0\0\x4\0\0\0\x4\0\0\0\b\0\0\0\b\xfc\0\0\0\x1\0\0\0\x2\0\0\0\x1\0\0\0\xe\0t\0o\0o\0l\0\x42\0\x61\0r\0\0\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0)'';
                PreviewSplitterState = "980, 0";
                SearchViewState = "@ByteArray()";
                SplitterState = "230, 1700";
              };
            }
            |> ini.generate "keepassxc-config.ini";
        };
      };
  };
}
